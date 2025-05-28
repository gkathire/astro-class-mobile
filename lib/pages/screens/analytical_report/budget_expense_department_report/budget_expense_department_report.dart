import 'package:collection/collection.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/models/app_custom_model.dart';
import 'package:astro_mobile/pages/fl_chart/chart_view/fl_pie_chart_widget.dart';
import 'package:astro_mobile/pages/screens/analytical_report/budget_expense_department_report/budget_expense_department_report_filter_widget.dart';
import 'package:astro_mobile/screen_utils/color_utils.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class BudgetExpenseDepartmentReport extends StatefulWidget {
  final int movieId;
  final int companyId;
  final int predefinedCurrencyTypeId;
  const BudgetExpenseDepartmentReport(
      {super.key,
      required this.movieId,
      required this.predefinedCurrencyTypeId,
      required this.companyId});

  @override
  State<BudgetExpenseDepartmentReport> createState() =>
      _BudgetExpenseDepartmentReportState();
}

class _BudgetExpenseDepartmentReportState
    extends State<BudgetExpenseDepartmentReport> {
  GetIt getIt = GetIt.instance;
  late ApiService _apiService;
  late LoggerService _loggerService;
  List<MovieBudgetExpenseSummaryPieChartContainer>?
      movieBudgetExpenseDepartmentSummaryList;
  double totalBudgetAmount = 0;
  double totalExpenseAmount = 0;
  double totalPaidAmount = 0;
  bool? isFilterActive;
  int? selectedPredefinedBudgetDivisionTypeId;

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

  Future<void> getMovieBudgetExpenseSummary(
      {required int movieId, int? predefinedBudgetDivisionTypeId}) async {
    try {
      EasyLoading.show();
      if (mounted) {
        setState(() {
          selectedPredefinedBudgetDivisionTypeId =
              predefinedBudgetDivisionTypeId;
        });
      }
      var summaryResult = await _apiService
          .getConsolidatedMovieBudgetExpenseSummaryForAllDepartmentByPredefinedBudgetDivisionTypeId(
              movieId: movieId,
              predefinedBudgetDivisionTypeId: predefinedBudgetDivisionTypeId);
      if (summaryResult == null) {
        _loggerService.writeLog(
            "getConsolidatedMovieBudgetExpenseSummaryForAllDepartmentByPredefinedBudgetDivisionTypeId: Unable to get movie budget expense summary",
            LogMessageLevel.error);
        showErrorDialog(context, "Unable to get movie budget expense summary");

        return;
      } else if (!summaryResult.success) {
        _loggerService.writeLog(
            "getConsolidatedMovieBudgetExpenseSummaryForAllDepartmentByPredefinedBudgetDivisionTypeId: no data found - ${summaryResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context,
            "No movie budget expense summary data found: ${summaryResult.errorMsg}");
        return;
      }
      var budgetExpenseSummaryList = summaryResult.result?.model ?? [];
      if (mounted) {
        setState(() {
          movieBudgetExpenseDepartmentSummaryList = [];
          totalBudgetAmount = 0;
          totalExpenseAmount = 0;
          totalPaidAmount = 0;

          if (predefinedBudgetDivisionTypeId == null) {
            var allDivisionConsolidatedReport =
                getConsolidatedDepartmentSummary(budgetExpenseSummaryList);
            for (var i = 0; i < allDivisionConsolidatedReport.length; i++) {
              allDivisionConsolidatedReport[i].categoryColor =
                  ColorUtils.getRandomColor(i);
              // calculate budget amount
              totalBudgetAmount +=
                  allDivisionConsolidatedReport[i].totalBudgetAmount ?? 0;
              totalExpenseAmount +=
                  allDivisionConsolidatedReport[i].totalExpenseAmount ?? 0;
              totalPaidAmount +=
                  allDivisionConsolidatedReport[i].totalPaidAmount ?? 0;
            }
            movieBudgetExpenseDepartmentSummaryList =
                allDivisionConsolidatedReport;
          } else {
            for (var i = 0; i < budgetExpenseSummaryList.length; i++) {
              var summary = budgetExpenseSummaryList[i];
              var container = MovieBudgetExpenseSummaryPieChartContainer(
                  categoryColor: ColorUtils.getRandomColor(i),
                  totalBudgetAmount: summary.totalBudgetAmount ?? 0,
                  totalExpenseAmount: summary.totalExpenseAmount ?? 0,
                  totalPaidAmount: summary.totalPaidAmount ?? 0,
                  sectionName: summary.departmentName ?? "Not Valid Name");
              movieBudgetExpenseDepartmentSummaryList?.add(container);
              // calculate budget amount
              totalBudgetAmount += summary.totalBudgetAmount ?? 0;
              totalExpenseAmount += summary.totalExpenseAmount ?? 0;
              totalPaidAmount += summary.totalPaidAmount ?? 0;
            }
          }
        });
      }
    } catch (e, stackTrace) {
      _loggerService.writeLog(
          "getConsolidatedMovieBudgetExpenseSummaryForAllDepartmentByPredefinedBudgetDivisionTypeId: Unable to get movie budget expense summary",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context, "Unable to get movie budget expense summary");
    } finally {
      EasyLoading.dismiss();
    }
  }

  List<MovieBudgetExpenseSummaryPieChartContainer>
      getConsolidatedDepartmentSummary(
          List<MovieBudgetExpenseSummaryForAllDepartmentModel>?
              departmentSummaryList) {
    List<MovieBudgetExpenseSummaryPieChartContainer> result = [];

    if (departmentSummaryList != null) {
      var groupedDepartmentSummary =
          departmentSummaryList.groupListsBy((e) => e.departmentId);

      for (var dObj in groupedDepartmentSummary.entries) {
        var departments = dObj.value;
        var sObj = MovieBudgetExpenseSummaryPieChartContainer(
            totalBudgetAmount: 0,
            totalExpenseAmount: 0,
            totalPaidAmount: 0,
            sectionName: departments[0].departmentName ?? "",
            categoryColor: Colors.blue);
        for (var dp in departments) {
          sObj.totalBudgetAmount += dp.totalBudgetAmount ?? 0;
          sObj.totalExpenseAmount += dp.totalExpenseAmount ?? 0;
          sObj.totalPaidAmount += dp.totalPaidAmount ?? 0;
        }
        result.add(sObj);
      }
    }

    return result;
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
              const Text("Department Report"),
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
                      showBudgetExpenseDepartmentFilterWidget(
                        context: context,
                        predefinedBudgetDivisionTypeId:
                            selectedPredefinedBudgetDivisionTypeId,
                        onResetFilter: () {
                          onResetMovieBudgetSummary();
                        },
                        movieId: widget.movieId,
                        companyId: widget.companyId,
                        onSubmitFilter: (
                            {selectedPredefinedBudgetDivisionTypeId}) {
                          isFilterActive = true;
                          getMovieBudgetExpenseSummary(
                            movieId: widget.movieId,
                            predefinedBudgetDivisionTypeId:
                                selectedPredefinedBudgetDivisionTypeId,
                          );
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
        body: SingleChildScrollView(
            padding: ContentStyle.contentSmallPadding,
            child: Container(
              width: 300.w,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TabBar(
                        tabAlignment: TabAlignment.start,
                        onTap: (value) {},
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: ThemeColor.mainThemeColor),
                        indicatorPadding:
                            const EdgeInsets.fromLTRB(-10, 10, -10, 10),
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2),
                        splashBorderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        dividerColor: Colors.transparent,
                        tabs: const [
                          Tab(text: "Budget"),
                          Tab(child: Text(" Expense")),
                          Tab(child: Text(" Paid")),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.sh, // Set a fixed height
                      child: TabBarView(
                        children: [
                          FlPieChartWidget(
                            movieBudgetExpenseCategoryList:
                                movieBudgetExpenseDepartmentSummaryList,
                            totalAmountValue: totalBudgetAmount,
                            pieChartViewTypeId: PieChartViewTypes.budgetView,
                            totalBudgetAmountValue: totalBudgetAmount,
                            totalExpenseAmountValue: totalExpenseAmount,
                            totalPaidAmountValue: totalPaidAmount,
                            predefinedCurrencyTypeId:
                                widget.predefinedCurrencyTypeId,
                            chartTitle: "Budget",
                          ),
                          FlPieChartWidget(
                            movieBudgetExpenseCategoryList:
                                movieBudgetExpenseDepartmentSummaryList,
                            totalAmountValue: totalExpenseAmount,
                            chartTitle: "Expense",
                            totalBudgetAmountValue: totalBudgetAmount,
                            totalExpenseAmountValue: totalExpenseAmount,
                            totalPaidAmountValue: totalPaidAmount,
                            predefinedCurrencyTypeId:
                                widget.predefinedCurrencyTypeId,
                            pieChartViewTypeId: PieChartViewTypes.expenseView,
                          ),
                          FlPieChartWidget(
                            movieBudgetExpenseCategoryList:
                                movieBudgetExpenseDepartmentSummaryList,
                            totalAmountValue: totalPaidAmount,
                            totalBudgetAmountValue: totalBudgetAmount,
                            totalExpenseAmountValue: totalExpenseAmount,
                            totalPaidAmountValue: totalPaidAmount,
                            predefinedCurrencyTypeId:
                                widget.predefinedCurrencyTypeId,
                            pieChartViewTypeId: PieChartViewTypes.paidView,
                            chartTitle: "Paid",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
