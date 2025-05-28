import 'package:flutter/material.dart';
import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/bloc/navigation/navigation_bloc.dart';
import 'package:flutter_app/bloc/navigation/navigation_event.dart';
import 'package:flutter_app/bloc/navigation/navigation_state.dart';
import 'package:flutter_app/constant/assets.dart';
import 'package:flutter_app/framework/enum/app_enum.dart';
import 'package:flutter_app/locator/locator_setup.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigator extends StatefulWidget {
  final List<MovieModel>? movieList;
  final MovieModel? selectedMovie;
  const AppBottomNavigator(
      {super.key, required this.movieList, required this.selectedMovie});

  @override
  State<StatefulWidget> createState() => _AppBottomNavigator();
}

class _AppBottomNavigator extends State<AppBottomNavigator> {
  final navigationBloc = getIt<NavigationBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        bloc: navigationBloc,
        builder: (context, state) {
          final movieList = state.movieList;
          final selectedMovie = state.selectedMovie;
          if (state is NavigationStateSelectedItem) {
            return BottomNavigationBar(
                currentIndex: state.selectedIndex,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: Colors.white,
                selectedLabelStyle: TextStyle(
                  color: ThemeColor.mainThemeColor,
                ),
                unselectedLabelStyle: TextStyle(
                  color: ThemeColor.mainThemeColor,
                ),
                selectedIconTheme:
                    IconThemeData(color: ThemeColor.mainThemeColor),
                unselectedIconTheme:
                    IconThemeData(color: ThemeColor.mainThemeColor),
                onTap: (index) {
                  navigationBloc.add(NavigationEventSelectedItem(
                      selectedIndex: index,
                      movieList: movieList,
                      selectedMovie: selectedMovie));
                },
                items: bottomNavigationItem(index: state.selectedIndex));
          } else {
            return const AppBottomNavigationForNoData();
          }
        });
  }
}

class AppBottomNavigationForNoData extends StatelessWidget {
  const AppBottomNavigationForNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        unselectedItemColor: ThemeColor.mainThemeColor,
        selectedItemColor: ThemeColor.mainThemeColor,
        onTap: (index) {},
        items: bottomNavigationItem(index: 0));
  }
}

List<BottomNavigationBarItem> bottomNavigationItem({required int index}) {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Image.asset(
          index == AppPageNavigation.home.value
              ? AppImageAssets.homeEnableImage
              : AppImageAssets.homeDisableImage,
          width: 30, // Adjust size if needed
          height: 30,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        icon: Image.asset(
          index == AppPageNavigation.reports.value
              ? AppImageAssets.scheduleEnableImage
              : AppImageAssets.scheduleDisableImage,
          width: 30, // Adjust size if needed
          height: 30,
        ),
        label: "Reports"),
    BottomNavigationBarItem(
        icon: Image.asset(
          index == AppPageNavigation.chat.value
              ? AppImageAssets.chatEnableImage
              : AppImageAssets.chatDisableImage,
          width: 30, // Adjust size if needed
          height: 30,
        ),
        label: "Chat"),
  ];
}
