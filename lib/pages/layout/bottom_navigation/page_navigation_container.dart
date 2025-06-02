import 'package:astro_mobile/bloc/navigation/navigation_bloc.dart';
import 'package:astro_mobile/bloc/navigation/navigation_event.dart';
import 'package:astro_mobile/bloc/navigation/navigation_state.dart';
import 'package:astro_mobile/common_widget/no_data/no_data_found_widget.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/framework/services/app_session_service.dart';
import 'package:astro_mobile/locator/locator_setup.dart';
import 'package:astro_mobile/models/app-model.dart';
import 'package:astro_mobile/pages/screens/chat/chat_list_screen.dart';
import 'package:astro_mobile/pages/screens/main_pages/dashboard/dashboard_welcome_page.dart';
import 'package:astro_mobile/pages/screens/main_pages/report/reports_information_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef PageNavigationSelectionCallback = void Function(
    int? selectedNavigationIndex);

class PageNavigationContainer extends StatefulWidget {
  final AppSessionService sessionService;
  final ApiService apiService;
  final LoggerService loggerService;
  final LoggedInUserModel? userModel;
  final int predefinedCurrencyTypeId;
  final PageNavigationSelectionCallback onPageNavigationSelection;

  const PageNavigationContainer(
      {super.key,
      required this.userModel,
      required this.apiService,
      required this.loggerService,
      required this.predefinedCurrencyTypeId,
      required this.sessionService,
      required this.onPageNavigationSelection});

  @override
  State<PageNavigationContainer> createState() =>
      _PageNavigationContainerState();
}

class _PageNavigationContainerState extends State<PageNavigationContainer> {
  final navigationBloc = getIt<NavigationBloc>();

  @override
  Widget build(BuildContext context) {
    navigationBloc.add(NavigationEventSelectedItem(
        selectedIndex: AppPageNavigation.home.value));
    return BlocConsumer<NavigationBloc, NavigationState>(
      bloc: navigationBloc,
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onPageNavigationSelection(state.selectedIndex);
        });
        if (state.selectedIndex == AppPageNavigation.home.value) {
          return DashboardHomeScreenContent(
              predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
              userModel: widget.userModel);
        } else if (state.selectedIndex == AppPageNavigation.reports.value) {
          return ReportsInformationPage(
            userModel: widget.userModel,
            predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
          );
        } else if (state.selectedIndex == AppPageNavigation.chat.value) {
          return ChatListScreen(
            companyId: widget.userModel?.companyId,
            userModel: widget.userModel,
          );
        } else {
          return const NoDataFoundWidget(
            canShowMessage: true,
          );
        }
      },
    );
  }
}
