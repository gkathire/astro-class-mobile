enum LogMessageLevel {
  nothing,
  verbose,
  info,
  debug,
  warning,
  error,
}

enum AppPageNavigation {
  home(0),
  reports(1),
  chat(2);

  const AppPageNavigation(this.value);
  final int value;
}

enum GenericInformationPageTypes {
  noDataFound,
  loadingPage,
  serverError,
}
