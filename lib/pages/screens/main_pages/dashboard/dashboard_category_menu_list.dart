import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter_app/models/app_custom_model.dart';

final List<HomeScreenCategoryMenuModel> dashboardCategoryMenuList = [
  HomeScreenCategoryMenuModel(homeScreenCategoryItems: [
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "Users",
        categoryMenuIcon: AppImageAssets.usersProfileImage,
        categoryMenuTypeId: PredefinedHomeScreenCategoryMenuTypes.companyUser),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "", categoryMenuIcon: '', categoryMenuTypeId: 0),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "", categoryMenuIcon: '', categoryMenuTypeId: 0),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "", categoryMenuIcon: '', categoryMenuTypeId: 0),
  ], categorySectionTitle: "Overall Menu"),
  // pre production
  HomeScreenCategoryMenuModel(homeScreenCategoryItems: [
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "Out Standing Schedules",
        categoryMenuIcon: AppImageAssets.note,
        categoryMenuTypeId:
            PredefinedHomeScreenCategoryMenuTypes.analyticalOutStandingReport),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "Resource Type",
        categoryMenuIcon: AppImageAssets.resourceType,
        categoryMenuTypeId:
            PredefinedHomeScreenCategoryMenuTypes.analyticalReportResourceType),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "Department",
        categoryMenuIcon: AppImageAssets.buildingSvgIcon,
        categoryMenuTypeId:
            PredefinedHomeScreenCategoryMenuTypes.analyticalReportByDepartment),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "Monthly",
        categoryMenuIcon: AppImageAssets.monthlyReport,
        categoryMenuTypeId:
            PredefinedHomeScreenCategoryMenuTypes.analyticalReportByMonthly),
    HomeScreenCategoryItemMenuModel(
        categoryMenuLabel: "", categoryMenuIcon: '', categoryMenuTypeId: 0),
  ], categorySectionTitle: "Analytical Report"),
];
