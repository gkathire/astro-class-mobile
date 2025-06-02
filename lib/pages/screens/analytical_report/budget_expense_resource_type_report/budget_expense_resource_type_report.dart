import 'dart:io';

import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/loader/spinner_widget.dart';
import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/common_widget/styles/dot_widget.dart';
import 'package:astro_mobile/constant/constant.dart';
import 'package:astro_mobile/framework/common/utils/calculation_utils.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/model/framework_model.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/pages/fl_chart/chart_view/fl_bar_chart_widget.dart';
import 'package:astro_mobile/pages/fl_chart/utils/bar_chart_group.dart';
import 'package:astro_mobile/pages/fl_chart/utils/fl_chart_colors.dart';
import 'package:astro_mobile/screen_utils/currency_utils.dart';
import 'package:astro_mobile/screen_utils/screen_size_utils.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../theme_data/theme_color.dart';

class BudgetExpenseResourceTypeReport extends StatefulWidget {
  final int movieId;
  final int companyId;
  final int predefinedCurrencyTypeId;
  const BudgetExpenseResourceTypeReport(
      {super.key,
      required this.movieId,
      required this.predefinedCurrencyTypeId,
      required this.companyId});

  @override
  State<BudgetExpenseResourceTypeReport> createState() =>
      _BudgetExpenseResourceTypeReportState();
}

class _BudgetExpenseResourceTypeReportState
    extends State<BudgetExpenseResourceTypeReport> {
  GetIt getIt = GetIt.instance;
  late ApiService _apiService;
  late LoggerService _loggerService;
  double maxValueOfY = 100;
  double maxAmountValue = 0;
  double totalBudgetAmount = 0;
  double totalExpenseAmount = 0;
  double totalPaidAmount = 0;
  final double barRodWidth = 20;
  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [];

  ConsolidatedMovieResourceBudgetExpenseSummaryModel? movieBudgetExpenseSummary;
  final List<String> titles = <String>['Art', 'Tech', 'Equip', 'Ven', 'Prop'];
  List<FlChartBudgetExpensePaidSummary> summaryList = [];
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getMovieBudgetExpenseSummary(widget.movieId);
    });
  }

  Future<void> onSelectMoreOption({required int option}) async {
    if (option == PredefinedMovieChartReportMenuOptions.download) {
      await _captureAndSaveChart(isShareImage: true);
    } else if (option == PredefinedMovieChartReportMenuOptions.share) {
      await _captureAndSaveChart(isShareImage: true);
    }
  }

  Future<void> _captureAndSaveChart({required bool isShareImage}) async {
    try {
      final image = await screenshotController.capture();
      if (image == null) return;

      final directory = await getApplicationSupportDirectory();
      final imagePath = '${directory.path}/chart.png';
      final imageFile = File(imagePath);

      await imageFile.writeAsBytes(image);

      if (isShareImage == true) {
        // Share or save the file
        await Share.shareXFiles([XFile(imagePath)],
            text: 'overall chart image');
      }
    } catch (e, stackTrace) {
      _loggerService.writeLog(
          "Unable to download image", LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to download image");
    }
  }

  Future<void> getMovieBudgetExpenseSummary(int movieId) async {
    try {
      // EasyLoading.show();

      var summaryResult = await _apiService
          .getConsolidatedBudgetExpenseReportByMovieResource(movieId: movieId);
      if (summaryResult == null) {
        _loggerService.writeLog(
            "getConsolidatedBudgetExpenseReportByMovieResource: Unable to get movie budget expense summary",
            LogMessageLevel.error);
        showErrorDialog(context, "Unable to get movie budget expense summary");

        return;
      } else if (!summaryResult.success) {
        _loggerService.writeLog(
            "getConsolidatedBudgetExpenseReportByMovieResource: no data found - ${summaryResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context,
            "No movie budget expense summary data found: ${summaryResult.errorMsg}");
        return;
      }
      if (mounted) {
        setState(() {
          movieBudgetExpenseSummary = summaryResult.result?.model;
        });
      }
      var allAmountValues = [
        movieBudgetExpenseSummary?.artistBudgetTotalAmount ?? 0,
        movieBudgetExpenseSummary?.technicianBudgetTotalAmount ?? 0,
        movieBudgetExpenseSummary?.equipmentBudgetTotalAmount ?? 0,
        movieBudgetExpenseSummary?.vendorBudgetTotalAmount ?? 0,
        movieBudgetExpenseSummary?.propertyBudgetTotalAmount ?? 0,
        movieBudgetExpenseSummary?.artistExpenseTotalAmount ?? 0,
        movieBudgetExpenseSummary?.technicianExpenseTotalAmount ?? 0,
        movieBudgetExpenseSummary?.equipmentExpenseTotalAmount ?? 0,
        movieBudgetExpenseSummary?.vendorExpenseTotalAmount ?? 0,
        movieBudgetExpenseSummary?.propertyExpenseTotalAmount ?? 0,
        movieBudgetExpenseSummary?.artistPaidTotalAmount ?? 0,
        movieBudgetExpenseSummary?.technicianPaidTotalAmount ?? 0,
        movieBudgetExpenseSummary?.equipmentPaidTotalAmount ?? 0,
        movieBudgetExpenseSummary?.vendorPaidTotalAmount ?? 0,
        movieBudgetExpenseSummary?.propertyPaidTotalAmount ?? 0,
      ];
      if (mounted) {
        setState(() {
          maxAmountValue = allAmountValues.reduce((a, b) => a > b ? a : b);

          totalBudgetAmount = 0;
          totalExpenseAmount = 0;
          totalPaidAmount = 0;

          totalBudgetAmount =
              (movieBudgetExpenseSummary?.artistBudgetTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.technicianBudgetTotalAmount ??
                      0) +
                  (movieBudgetExpenseSummary?.equipmentBudgetTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.vendorBudgetTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.propertyBudgetTotalAmount ?? 0);

          totalExpenseAmount = (movieBudgetExpenseSummary
                      ?.artistExpenseTotalAmount ??
                  0) +
              (movieBudgetExpenseSummary?.technicianExpenseTotalAmount ?? 0) +
              (movieBudgetExpenseSummary?.equipmentExpenseTotalAmount ?? 0) +
              (movieBudgetExpenseSummary?.vendorExpenseTotalAmount ?? 0) +
              (movieBudgetExpenseSummary?.propertyExpenseTotalAmount ?? 0);

          totalPaidAmount =
              (movieBudgetExpenseSummary?.artistPaidTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.technicianPaidTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.equipmentPaidTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.vendorPaidTotalAmount ?? 0) +
                  (movieBudgetExpenseSummary?.propertyPaidTotalAmount ?? 0);
        });
      }
      // bar group data calculation  -- artist
      final barGroup1 = BarChartGroupUtils.makeGroupData(
          x: 0,
          y1: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.artistBudgetTotalAmount ?? 0,
              maxAmountValue),
          y2: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.artistExpenseTotalAmount ?? 0,
              maxAmountValue),
          y3: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.artistPaidTotalAmount ?? 0,
              maxAmountValue),
          leftBarColor: FlChartColors.contentColorGreen,
          middleBarColor: FlChartColors.contentColorRed,
          rightBarColor: FlChartColors.contentColorBlue,
          width: barRodWidth);
      final summary1 = FlChartBudgetExpensePaidSummary(
          totalPaidAmount:
              movieBudgetExpenseSummary?.artistPaidTotalAmount ?? 0,
          totalExpenseAmount:
              movieBudgetExpenseSummary?.artistExpenseTotalAmount ?? 0,
          totalBudgetAmount:
              movieBudgetExpenseSummary?.artistBudgetTotalAmount ?? 0);

      // bar group data calculation -- technician
      final barGroup2 = BarChartGroupUtils.makeGroupData(
          x: 1,
          y1: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.technicianBudgetTotalAmount ?? 0,
              maxAmountValue),
          y2: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.technicianExpenseTotalAmount ?? 0,
              maxAmountValue),
          y3: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.technicianPaidTotalAmount ?? 0,
              maxAmountValue),
          leftBarColor: FlChartColors.contentColorGreen,
          middleBarColor: FlChartColors.contentColorRed,
          rightBarColor: FlChartColors.contentColorBlue,
          width: barRodWidth);

      final summary2 = FlChartBudgetExpensePaidSummary(
          totalPaidAmount:
              movieBudgetExpenseSummary?.technicianPaidTotalAmount ?? 0,
          totalExpenseAmount:
              movieBudgetExpenseSummary?.technicianExpenseTotalAmount ?? 0,
          totalBudgetAmount:
              movieBudgetExpenseSummary?.technicianBudgetTotalAmount ?? 0);
      // equipment group
      final barGroup3 = BarChartGroupUtils.makeGroupData(
          x: 2,
          y1: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.equipmentBudgetTotalAmount ?? 0,
              maxAmountValue),
          y2: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.equipmentExpenseTotalAmount ?? 0,
              maxAmountValue),
          y3: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.equipmentPaidTotalAmount ?? 0,
              maxAmountValue),
          leftBarColor: FlChartColors.contentColorGreen,
          middleBarColor: FlChartColors.contentColorRed,
          rightBarColor: FlChartColors.contentColorBlue,
          width: barRodWidth);

      final summary3 = FlChartBudgetExpensePaidSummary(
          totalPaidAmount:
              movieBudgetExpenseSummary?.equipmentPaidTotalAmount ?? 0,
          totalExpenseAmount:
              movieBudgetExpenseSummary?.equipmentExpenseTotalAmount ?? 0,
          totalBudgetAmount:
              movieBudgetExpenseSummary?.equipmentBudgetTotalAmount ?? 0);

      final barGroup4 = BarChartGroupUtils.makeGroupData(
          x: 3,
          y1: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.vendorBudgetTotalAmount ?? 0,
              maxAmountValue),
          y2: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.vendorExpenseTotalAmount ?? 0,
              maxAmountValue),
          y3: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.vendorPaidTotalAmount ?? 0,
              maxAmountValue),
          leftBarColor: FlChartColors.contentColorGreen,
          middleBarColor: FlChartColors.contentColorRed,
          rightBarColor: FlChartColors.contentColorBlue,
          width: barRodWidth);

      final summary4 = FlChartBudgetExpensePaidSummary(
          totalPaidAmount:
              movieBudgetExpenseSummary?.vendorPaidTotalAmount ?? 0,
          totalExpenseAmount:
              movieBudgetExpenseSummary?.vendorExpenseTotalAmount ?? 0,
          totalBudgetAmount:
              movieBudgetExpenseSummary?.vendorBudgetTotalAmount ?? 0);
      // property
      final barGroup5 = BarChartGroupUtils.makeGroupData(
          x: 4,
          y1: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.propertyBudgetTotalAmount ?? 0,
              maxAmountValue),
          y2: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.propertyExpenseTotalAmount ?? 0,
              maxAmountValue),
          y3: CalculationUtils.getPercentageValue(
              movieBudgetExpenseSummary?.propertyPaidTotalAmount ?? 0,
              maxAmountValue),
          leftBarColor: FlChartColors.contentColorGreen,
          middleBarColor: FlChartColors.contentColorRed,
          rightBarColor: FlChartColors.contentColorBlue,
          width: barRodWidth);

      final summary5 = FlChartBudgetExpensePaidSummary(
          totalPaidAmount:
              movieBudgetExpenseSummary?.propertyPaidTotalAmount ?? 0,
          totalExpenseAmount:
              movieBudgetExpenseSummary?.propertyExpenseTotalAmount ?? 0,
          totalBudgetAmount:
              movieBudgetExpenseSummary?.propertyBudgetTotalAmount ?? 0);

      final items = [
        barGroup1,
        barGroup2,
        barGroup3,
        barGroup4,
        barGroup5,
      ];

      if (mounted) {
        setState(() {
          summaryList = [summary1, summary2, summary3, summary4, summary5];

          rawBarGroups = items;
          showingBarGroups = rawBarGroups;
        });
      }
    } catch (e, stackTrace) {
      _loggerService.writeLog(
          "getConsolidatedBudgetExpenseReportByMovieResource: Unable to get movie budget expense summary",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context, "Unable to get movie budget expense summary");
    } finally {
      // EasyLoading.dismiss();
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
              const Text("Resource Type Report"),
              PopupMenuButton(
                color: Colors.white,
                elevation: 10,
                itemBuilder: (context) {
                  return budgetExpenseChartOptions.map((Status value) {
                    return PopupMenuItem<Status>(
                        onTap: () {
                          onSelectMoreOption(option: value.id ?? -1);
                        },
                        child: Text(value.type));
                  }).toList();
                },
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
            movieBudgetExpenseSummary != null
                ? FlBarChartWidget(
                    maxAmountValue: maxAmountValue,
                    rawBarGroups: rawBarGroups,
                    summaryList: summaryList,
                    showingBarGroups: showingBarGroups,
                    titles: titles,
                    predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
                    key: widget.key,
                  )
                : Container(
                    height: 300.h,
                    width: ScreenSizeUtils.getScreenWidth(context) - 50.w,
                    padding: ContentStyle.contentSmallPadding,
                    child: spinnerWidget(transparent: false),
                  ),
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
