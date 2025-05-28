import 'package:flutter_app/framework/model/framework_model.dart';

const List<String> allowedAllFileExtensions = [
  "doc",
  "docx",
  "pdf",
  "txt",
  "xlsx",
  "xls",
  "png",
  "jpeg",
  "jpg",
  "webp"
];

class PredefinedHomeScreenCategoryMenuTypes {
  static const int companyUser = 1001;

  static const int analyticalDailyStatusReport = 7001;
  static const int analyticalReportOverallExpenses = 7002;
  static const int analyticalReportCastAndCrew = 7003;
  static const int analyticalReportResourceType = 7004;
  static const int analyticalReportByCategory = 7005;
  static const int analyticalReportByDepartment = 7006;
  static const int analyticalReportByMonthly = 7007;
  static const int analyticalOutStandingReport = 7008;
}

class PieChartViewTypes {
  static const int budgetView = 1;
  static const int expenseView = 2;
  static const int paidView = 3;
}

class PredefinedMovieChartReportMenuOptions {
  static const int download = 1;
  static const int share = 2;
}

class MessageAlertTypes {
  static const int success = 1;
  static const int error = 2;
  static const int warning = 3;
  static const int information = 4;
}

List<Status> budgetExpenseChartOptions = [
  Status(id: PredefinedMovieChartReportMenuOptions.download, type: "download"),
  Status(id: PredefinedMovieChartReportMenuOptions.share, type: "Share"),
];

class PredefinedMovieBudgetSummaryReportMenuOptions {
  static const int exportExpanseTally = 1;
  static const int exportExpenseCsv = 2;
  static const int exportBudgetCsv = 3;
  static const int exportBudgetTopSheet = 4;
}

List<Status> movieBudgetSummaryReportMenuOptions = [
  Status(
      id: PredefinedMovieBudgetSummaryReportMenuOptions.exportExpanseTally,
      type: "Export Expense Tally"),
  Status(
      id: PredefinedMovieBudgetSummaryReportMenuOptions.exportExpenseCsv,
      type: "Export Expense Csv"),
  Status(
      id: PredefinedMovieBudgetSummaryReportMenuOptions.exportBudgetCsv,
      type: "Export Budget Csv"),
  Status(
      id: PredefinedMovieBudgetSummaryReportMenuOptions.exportBudgetTopSheet,
      type: "Export Budget Top sheet"),
];

class ProductionProcessPreProductionScreenTypes {
  static const schedules = 101;
  static const locations = 102;
  static const contracts = 103;
  static const dailyStatusReport = 104;
  static const files = 105;
  static const budget = 106;
  static const expense = 107;
  static const attendance = 108;
}

class BudgetExpenseFileUploadOptions {
  static const documentUpload = 1;
  static const scanDocumentUpload = 2;
  static const takePicture = 3;
  static const addVoucher = 4;
}
