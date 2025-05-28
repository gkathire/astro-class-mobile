import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/loader/spinner_widget.dart';
import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/common_widget/styles/dot_widget.dart';
import 'package:astro_mobile/framework/common/utils/calculation_utils.dart';
import 'package:astro_mobile/framework/common/utils/date_utils.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/models/app_custom_model.dart';
import 'package:astro_mobile/pages/fl_chart/chart_view/fl_bar_chart_widget.dart';
import 'package:astro_mobile/pages/fl_chart/utils/bar_chart_group.dart';
import 'package:astro_mobile/pages/fl_chart/utils/fl_chart_colors.dart';
import 'package:astro_mobile/pages/screens/analytical_report/budget_expense_monthly_report/budget_expense_monthly_report_filter_widget.dart';
import 'package:astro_mobile/screen_utils/currency_utils.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../theme_data/theme_color.dart';

class BudgetExpenseMonthlyReport extends StatefulWidget {
  final int movieId;
  final int companyId;
  final int predefinedCurrencyTypeId;

  const BudgetExpenseMonthlyReport(
      {super.key,
      required this.movieId,
      required this.predefinedCurrencyTypeId,
      required this.companyId});

  @override
  State<BudgetExpenseMonthlyReport> createState() =>
      _BudgetExpenseMonthlyReportState();
}

class _BudgetExpenseMonthlyReportState
    extends State<BudgetExpenseMonthlyReport> {
  GetIt getIt = GetIt.instance;
  late ApiService _apiService;
  late LoggerService _loggerService;
  double maxAmountValue = 0;
  double totalBudgetAmount = 0;
  double totalExpenseAmount = 0;
  double totalPaidAmount = 0;
  bool isLoading = false;
  int touchedGroupIndex = -1;
  double barRodWidth = 20;
  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [];
  List<FlChartBudgetExpensePaidSummary> flChartSummary = [];

  List<MonthlyMovieShootDayBudgetExpenseSummaryModel>
      movieBudgetExpenseMonthlySummaryList = [];
  List<String> titles = [];
  List<MovieBudgetExpenseMonthlySummaryContainerModel>
      movieBudgetExpenseMonthlySummaryContainerList = [];
  MovieBudgetExpenseMonthlySummaryContainerModel?
      selectedMovieBudgetExpenseMonthlySummaryParentContainer;
  bool? isFilterActive;
  int? selectedPredefinedBudgetDivisionTypeId;
  Key _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getMovieBudgetExpenseSummary(movieId: widget.movieId);
    });
  }

  void onResetMovieBudgetSummary() async {
    if (mounted) {
      setState(() {
        isFilterActive = false;
        selectedPredefinedBudgetDivisionTypeId = null;
      });
    }
    await getMovieBudgetExpenseSummary(movieId: widget.movieId);
  }

  void onSubmitApplyFilter(
      {required int movieId,
      int? predefinedBudgetDivisionTypeId,
      MovieBudgetExpenseMonthlySummaryContainerModel?
          selectedMovieBudgetExpenseMonthlySummaryContainer}) async {
    if (mounted) {
      setState(() {
        isLoading = true;
        isFilterActive = true;
        selectedMovieBudgetExpenseMonthlySummaryParentContainer =
            selectedMovieBudgetExpenseMonthlySummaryContainer;
        selectedPredefinedBudgetDivisionTypeId = predefinedBudgetDivisionTypeId;
      });
    }

    if (predefinedBudgetDivisionTypeId != null) {
      await getMovieBudgetExpenseSummary(
        movieId: widget.movieId,
        predefinedBudgetDivisionTypeId: selectedPredefinedBudgetDivisionTypeId,
      );
    } else if (selectedMovieBudgetExpenseMonthlySummaryContainer != null) {
      loadChartData(
          summaryList: selectedMovieBudgetExpenseMonthlySummaryContainer
                  ?.reportSummary ??
              []);
    }
  }

  Future<void> getMovieBudgetExpenseSummary(
      {required int movieId, int? predefinedBudgetDivisionTypeId}) async {
    try {
      // EasyLoading.show();
      if (mounted) {
        setState(() {
          movieBudgetExpenseMonthlySummaryList = [];
          selectedPredefinedBudgetDivisionTypeId =
              predefinedBudgetDivisionTypeId;
        });
      }
      var summaryResult =
          await _apiService.getConsolidatedMonthlyBudgetExpenseReport(
        movieId: movieId,
        predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId,
      );
      if (summaryResult == null) {
        _loggerService.writeLog(
            "getConsolidatedMonthlyBudgetExpenseReport: Unable to get movie budget expense summary",
            LogMessageLevel.error);
        showErrorDialog(context, "Unable to get movie budget expense summary");

        return;
      } else if (!summaryResult.success) {
        _loggerService.writeLog(
            "getConsolidatedMonthlyBudgetExpenseReport: no data found - ${summaryResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context,
            "No movie budget expense summary data found: ${summaryResult.errorMsg}");
        return;
      }
      if (mounted) {
        setState(() {
          movieBudgetExpenseMonthlySummaryContainerList = [];

          movieBudgetExpenseMonthlySummaryList =
              summaryResult.result?.model ?? [];
          movieBudgetExpenseMonthlySummaryList.sort((a, b) {
            return (a.year ?? 0).compareTo(b.year ?? 0);
          });
        });
      }

      Map<String, List<MonthlyMovieShootDayBudgetExpenseSummaryModel>>
          groupedObject =
          groupBy<MonthlyMovieShootDayBudgetExpenseSummaryModel, String>(
              movieBudgetExpenseMonthlySummaryList,
              (obj) => obj.year.toString());

      var allYearObj = MovieBudgetExpenseMonthlySummaryContainerModel(
        reportSummary: movieBudgetExpenseMonthlySummaryList,
        year: 0,
        yearText: 'All',
      );
      movieBudgetExpenseMonthlySummaryContainerList.add(allYearObj);

      for (var mappedGroup in groupedObject.entries) {
        var obj = MovieBudgetExpenseMonthlySummaryContainerModel(
          reportSummary: mappedGroup.value,
          year: int.parse(mappedGroup.key),
          yearText: mappedGroup.key,
        );
        movieBudgetExpenseMonthlySummaryContainerList.add(obj);
      }

      if (mounted) {
        setState(() {
          if (selectedMovieBudgetExpenseMonthlySummaryParentContainer == null) {
            selectedMovieBudgetExpenseMonthlySummaryParentContainer =
                movieBudgetExpenseMonthlySummaryContainerList
                    .firstWhere((item) => item.year == 0);
          } else {
            selectedMovieBudgetExpenseMonthlySummaryParentContainer =
                movieBudgetExpenseMonthlySummaryContainerList.firstWhere(
                    (item) =>
                        item.year ==
                        selectedMovieBudgetExpenseMonthlySummaryParentContainer
                            ?.year,
                    orElse: () =>
                        MovieBudgetExpenseMonthlySummaryContainerModel(
                            year: 0, yearText: "No year", reportSummary: []));
          }

          if (selectedMovieBudgetExpenseMonthlySummaryParentContainer != null) {
            loadChartData(
                summaryList:
                    selectedMovieBudgetExpenseMonthlySummaryParentContainer
                            ?.reportSummary ??
                        []);
          }
        });
      }
    } catch (e, stackTrace) {
      _loggerService.writeLog(
          "getConsolidatedMonthlyBudgetExpenseReport: Unable to get movie budget expense summary",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context, "Unable to get movie budget expense summary");
    } finally {
      // EasyLoading.dismiss();
    }
  }

  void loadChartData(
      {required List<MonthlyMovieShootDayBudgetExpenseSummaryModel>
          summaryList}) {
    setState(() {
      totalBudgetAmount = 0;
      totalExpenseAmount = 0;
      totalPaidAmount = 0;
    });

    List<String> chartTitles = [];
    List<double> allAmountValues = [];

    for (var summary in summaryList) {
      if (summary.month != null) {
        var monthName =
            "${CustomDateUtils.getMonthNameFromMonthNumber(summary.month ?? 0).substring(0, 3)} - ${summary.year}";
        chartTitles.add(monthName);
        totalBudgetAmount += summary.totalBudgetAmount ?? 0;
        totalExpenseAmount += summary.totalExpenseAmount ?? 0;
        totalPaidAmount += summary.totalPaidAmount ?? 0;
        allAmountValues.add(summary.totalBudgetAmount ?? 0);
        allAmountValues.add(summary.totalExpenseAmount ?? 0);
        allAmountValues.add(summary.totalPaidAmount ?? 0);
      }
    }

    if (mounted) {
      setState(() {
        titles = chartTitles;

        maxAmountValue = allAmountValues.reduce((a, b) => a > b ? a : b);
        List<BarChartGroupData> barChartGroups = [];
        flChartSummary = [];

        if (summaryList.length < 3) {
          barRodWidth = 40;
        }

        for (var i = 0; i < summaryList.length; i++) {
          var summary = summaryList[i];
          var flChartData = FlChartBudgetExpensePaidSummary(
              totalPaidAmount: summary.totalPaidAmount ?? 0,
              totalExpenseAmount: summary.totalExpenseAmount ?? 0,
              totalBudgetAmount: summary.totalBudgetAmount ?? 0);
          final barGroup = BarChartGroupUtils.makeGroupData(
              x: i,
              y1: CalculationUtils.getPercentageValue(
                  summary.totalBudgetAmount ?? 0, maxAmountValue),
              y2: CalculationUtils.getPercentageValue(
                  summary.totalExpenseAmount ?? 0, maxAmountValue),
              y3: CalculationUtils.getPercentageValue(
                  summary.totalPaidAmount ?? 0, maxAmountValue),
              leftBarColor: FlChartColors.contentColorGreen,
              middleBarColor: FlChartColors.contentColorRed,
              rightBarColor: FlChartColors.contentColorBlue,
              width: barRodWidth);
          barChartGroups.add(barGroup);
          flChartSummary.add(flChartData);
        }
        rawBarGroups = barChartGroups;
        showingBarGroups = rawBarGroups;
        isLoading = false;
        _key = UniqueKey(); // Change the key to reinitialize the chart widget
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 30.w,
          titleTextStyle: TextStyle(
              fontSize: 20,
              color: ThemeColor.mainThemeColor,
              overflow: TextOverflow.ellipsis),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Monthly Report"),
              Container(
                decoration: BoxDecoration(
                    color: isFilterActive == true
                        ? ThemeColor.mainThemeColor
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                width: 40.w,
                height: 30.h,
                child: IconButton(
                    onPressed: () {
                      showBudgetExpenseMonthlyFilterWidget(
                        context: context,
                        movieBudgetExpenseContainerList:
                            movieBudgetExpenseMonthlySummaryContainerList,
                        selectedMovieBudgetExpenseContainer:
                            selectedMovieBudgetExpenseMonthlySummaryParentContainer,
                        predefinedBudgetDivisionTypeId:
                            selectedPredefinedBudgetDivisionTypeId,
                        onResetFilter: () {
                          onResetMovieBudgetSummary();
                        },
                        movieId: widget.movieId,
                        companyId: widget.companyId,
                        onSubmitFilter: (
                            {selectedPredefinedBudgetDivisionTypeId,
                            selectedYearSummaryContainer}) {
                          onSubmitApplyFilter(
                              movieId: widget.movieId,
                              predefinedBudgetDivisionTypeId:
                                  selectedPredefinedBudgetDivisionTypeId,
                              selectedMovieBudgetExpenseMonthlySummaryContainer:
                                  selectedYearSummaryContainer);
                        },
                      );
                    },
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: isFilterActive == true
                          ? Colors.white
                          : Colors.black87,
                    )),
              ),
            ],
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.keyboard_arrow_left_outlined)),
        ),
        backgroundColor: ThemeColor.white,
        body: Column(
          children: [
            if (selectedMovieBudgetExpenseMonthlySummaryParentContainer !=
                    null &&
                movieBudgetExpenseMonthlySummaryList.isNotEmpty &&
                isLoading == false) ...[
              FlBarChartWidget(
                maxAmountValue: maxAmountValue,
                titles: titles,
                summaryList: flChartSummary,
                rawBarGroups: rawBarGroups,
                showingBarGroups: showingBarGroups,
                predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
                key: _key,
              )
            ] else ...[
              Container(
                  height: 300.h,
                  width: ScreenSizeUtils.getScreenWidth(context) - 50.w,
                  padding: ContentStyle.contentSmallPadding,
                  child: spinnerWidget(transparent: false))
            ],
            Container(
                padding: ContentStyle.contentSmallPadding,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          child: Row(
                            children: [
                              DotWidget.getDotWidget(
                                  FlChartColors.contentColorGreen),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Total Budget Amount : ${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: totalBudgetAmount, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}",
                                textScaler: CustomTextScaler.headerThree,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          child: Row(
                            children: [
                              DotWidget.getDotWidget(
                                  FlChartColors.contentColorRed),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Total Expense Amount : ${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: totalExpenseAmount, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}",
                                textScaler: CustomTextScaler.headerThree,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Container(
                          child: Row(
                            children: [
                              DotWidget.getDotWidget(
                                  FlChartColors.contentColorBlue),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Total Paid Amount : ${CurrencyConversionUtils.getFormattedCurrencyApproxValue(amount: totalPaidAmount, predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId)}",
                                textScaler: CustomTextScaler.headerThree,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ));
  }
}
