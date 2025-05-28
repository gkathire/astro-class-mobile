import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_app/bloc/navigation/navigation_event.dart';
import 'package:flutter_app/bloc/navigation/navigation_state.dart';
import 'package:flutter_app/common_widget/no_data/no_data_found_widget.dart';
import 'package:flutter_app/framework/enum/app_enum.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:flutter_app/framework/services/api_service.dart';
import 'package:flutter_app/framework/services/app_session_service.dart';
import 'package:flutter_app/locator/locator_setup.dart';
import 'package:flutter_app/pages/screens/chat/chat_list_screen.dart';
import 'package:flutter_app/pages/screens/main_pages/dashboard/dashboard_welcome_page.dart';
import 'package:flutter_app/pages/screens/main_pages/report/reports_information_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef PageNavigationSelectionCallback = void Function(
    int? selectedNavigationIndex);

class PageNavigationContainer extends StatefulWidget {
  final AppSessionService sessionService;
  final ApiService apiService;
  final LoggerService loggerService;
  final LoggedInUserModel? userModel;
  final List<MovieModel>? movieListModel;
  final MovieModel? selectedMovie;
  final int predefinedCurrencyTypeId;
  final Uint8List? movieProfileByesData;
  final PageNavigationSelectionCallback onPageNavigationSelection;

  const PageNavigationContainer(
      {super.key,
      required this.userModel,
      required this.movieListModel,
      required this.selectedMovie,
      required this.apiService,
      required this.movieProfileByesData,
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
  final ValueNotifier<MovieBudgetDivisionModel?> _selectedMovieBudgetDivision =
      ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    navigationBloc.add(NavigationEventSelectedItem(
        movieList: widget.movieListModel,
        selectedMovie: widget.selectedMovie,
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
              selectedMovie: widget.selectedMovie,
              movieList: widget.movieListModel,
              movieProfileByesData: widget.movieProfileByesData,
              predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
              userModel: widget.userModel);
        } else if (state.selectedIndex == AppPageNavigation.reports.value) {
          return ReportsInformationPage(
            userModel: widget.userModel,
            predefinedCurrencyTypeId: widget.predefinedCurrencyTypeId,
            movieProfileByesData: widget.movieProfileByesData,
            movieListModel: widget.movieListModel,
            movieModel: widget.selectedMovie,
          );
        } else if (state.selectedIndex == AppPageNavigation.chat.value) {
          return ChatListScreen(
            companyId: widget.userModel?.companyId,
            movieId: widget.selectedMovie?.movieId,
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
