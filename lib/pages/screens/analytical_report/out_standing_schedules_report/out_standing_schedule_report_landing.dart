import 'dart:typed_data';

import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/api/services/enum_badge_service.dart';
import 'package:flutter_app/api/services/enum_text_color_service.dart';
import 'package:flutter_app/common_widget/dialogs/error_dialog.dart';
import 'package:flutter_app/common_widget/dialogs/loading_dialog.dart';
import 'package:flutter_app/common_widget/file/movie_profile_icon_widget.dart';
import 'package:flutter_app/common_widget/styles/content_style.dart';
import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/framework/enum/app_enum.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:flutter_app/framework/services/api_service.dart';
import 'package:flutter_app/pages/screens/analytical_report/out_standing_schedules_report/out_standing_schedule_report_amount_card.dart';
import 'package:flutter_app/pages/screens/analytical_report/out_standing_schedules_report/out_standing_schedule_report_scene_card_widget.dart';
import 'package:flutter_app/pages/screens/analytical_report/out_standing_schedules_report/out_standing_schedule_report_shoot_day_card_widget.dart';
import 'package:flutter_app/screen_utils/currency_utils.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class OutStandingSchedulesReportLandingPage extends StatefulWidget {
  int? companyId;
  int? movieId;
  final int predefinedCurrencyTypeId;
  final Uint8List? movieProfileByesData;

  OutStandingSchedulesReportLandingPage(
      {super.key,
      required this.companyId,
      required this.movieProfileByesData,
      required this.predefinedCurrencyTypeId,
      required this.movieId});

  @override
  State<OutStandingSchedulesReportLandingPage> createState() =>
      _OutStandingSchedulesReportLandingPageState();
}

class _OutStandingSchedulesReportLandingPageState
    extends State<OutStandingSchedulesReportLandingPage> {
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final EnumTextColorService _enumTextColorService;
  late final EnumBadgeService _enumBadgeService;
  final GetIt _getIt = GetIt.instance;
  MovieScheduleReportModel? movieShootDaySummaryModel;
  bool isMovieShootDayLoading = false;
  List<MovieShootDayModel> movieShootDays = [];

  @override
  void initState() {
    super.initState();
    _apiService = _getIt<ApiService>();
    _loggerService = _getIt<LoggerService>();
    _enumTextColorService = _getIt<EnumTextColorService>();
    _enumBadgeService = _getIt<EnumBadgeService>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getMovieShootDayScheduleReport(
        movieId: widget.movieId ?? 0,
      );
    });
  }

  Future<void> getMovieShootDayScheduleReport({required int? movieId}) async {
    try {
      canShowLoadingWidgetWithMessage(canShow: true);

      final movieScheduleReportResult =
          await _apiService.getScheduleReport(movieId: movieId);

      if (movieScheduleReportResult == null) {
        _loggerService.writeLog(
            "getScheduleReport: Unable to get movie schedule report",
            LogMessageLevel.error);
        showErrorDialog(context, "Unable to get movie schedule report");

        return;
      } else if (!movieScheduleReportResult.success) {
        _loggerService.writeLog(
            "getScheduleReport: no data found - ${movieScheduleReportResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context,
            "No movie shoot day movie schedule report found: ${movieScheduleReportResult.errorMsg}");
        return;
      }
      if (mounted) {
        setState(() {
          movieShootDays = [];
          movieShootDaySummaryModel = movieScheduleReportResult.result?.model;
          if (movieShootDaySummaryModel != null) {
            movieShootDays.addAll(movieShootDaySummaryModel
                    ?.outstandingProductionMovieShootDays ??
                []);
            movieShootDays.addAll(movieShootDaySummaryModel
                    ?.outstandingPreProductionMovieShootDays ??
                []);
            movieShootDays.addAll(movieShootDaySummaryModel
                    ?.outstandingPostProductionMovieShootDays ??
                []);
            movieShootDays.addAll(movieShootDaySummaryModel
                    ?.outstandingOtherProductionMovieShootDays ??
                []);
          }
        });
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();

      _loggerService.writeLog(
          "getScheduleReport: Unable to get movie schedule report",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context, "Unable to get movie schedule report");
    } finally {
      canShowLoadingWidgetWithMessage(canShow: false);
    }
  }

  canShowLoadingWidgetWithMessage({required bool canShow}) {
    if (canShow) {
      setState(() {
        isMovieShootDayLoading = true;
      });
      LoadingDialog().show(context: context, text: "Loading Please wait...");
    } else {
      setState(() {
        isMovieShootDayLoading = false;
      });
      LoadingDialog().hide();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Out Standing Schedules",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.keyboard_arrow_left_outlined)),
        ),
        backgroundColor: ThemeColor.lightGreyTwo,
        body: movieShootDaySummaryModel != null
            ? Container(
                padding: ContentStyle.contentSmallPadding,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert))
                        ],
                      ),
                      MovieProfileIconWidget(
                          movieProfileByesData: widget.movieProfileByesData),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DailyStatusReportAmountCard(
                              label: "Budget",
                              value: CurrencyConversionUtils
                                  .getFormattedCurrencyActualValue(
                                      amount: movieShootDaySummaryModel
                                              ?.totalBudgetAmount ??
                                          0,
                                      predefinedCurrencyTypeId:
                                          widget.predefinedCurrencyTypeId),
                              imageSrc: AppImageAssets.walletMinusImage),
                          DailyStatusReportAmountCard(
                              label: "Expense",
                              value: CurrencyConversionUtils
                                  .getFormattedCurrencyActualValue(
                                      amount: movieShootDaySummaryModel
                                              ?.totalExpenseAmount ??
                                          0,
                                      predefinedCurrencyTypeId:
                                          widget.predefinedCurrencyTypeId),
                              imageSrc: AppImageAssets.receiptItemImage),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DailyStatusReportAmountCard(
                              label: "Paid",
                              value: CurrencyConversionUtils
                                  .getFormattedCurrencyActualValue(
                                      amount: movieShootDaySummaryModel
                                              ?.totalPaidAmount ??
                                          0,
                                      predefinedCurrencyTypeId:
                                          widget.predefinedCurrencyTypeId),
                              imageSrc: AppImageAssets.receiptItemImage),
                          DailyStatusReportAmountCard(
                              label: "Total Schedules",
                              value: ((movieShootDaySummaryModel
                                              ?.completedMovieShootDayCount ??
                                          0) +
                                      (movieShootDaySummaryModel
                                              ?.notCompletedMovieShootDayCount ??
                                          0))
                                  .toString(),
                              imageSrc: AppImageAssets.calendarImage),
                        ],
                      ),
                      OutStandingScheduleReportSceneCardWidget(
                        enumTextColorService: _enumTextColorService,
                        completedMovieScenesCount: movieShootDaySummaryModel
                                ?.completedMovieSceneCount ??
                            0,
                        notCompletedMovieSceneCount: movieShootDaySummaryModel
                                ?.notCompletedMovieSceneCount ??
                            0,
                        movieSceneList:
                            movieShootDaySummaryModel?.outstandingMovieScenes,
                      ),
                      OutStandingScheduleReportShootDayCardWidget(
                          movieShootDayList: movieShootDays,
                          enumTextColorService: _enumTextColorService,
                          enumBadgeService: _enumBadgeService,
                          completedMovieShootDaysCount:
                              movieShootDaySummaryModel
                                      ?.completedMovieShootDayCount ??
                                  0,
                          notCompletedMovieShootDayCount:
                              movieShootDaySummaryModel
                                      ?.notCompletedMovieShootDayCount ??
                                  0)
                    ],
                  ),
                ))
            : Container());
  }
}
