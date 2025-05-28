import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/dialogs/confirmation_dialog.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/dialogs/success_dialog.dart';
import 'package:astro_mobile/common_widget/no_data/no_data_found_widget.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/pages/screens/user/user_crud_screen.dart';
import 'package:astro_mobile/pages/screens/user/user_filter_widget.dart';
import 'package:astro_mobile/pages/screens/user/user_list_item_widget.dart';
import 'package:astro_mobile/pages/widgets/search_text_field.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class UserListScreen extends StatefulWidget {
  int? companyId;
  int? movieId;
  UserListScreen({super.key, required this.companyId, required this.movieId});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController _controller = TextEditingController();
  GetIt getIt = GetIt.instance;
  String? searchTextValue;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  List<UserModel> users = [];
  var _isLoading = false;
  var activePageSize = 5;

  int? selectedPredefinedUserTypeId;
  int? selectedCompanyId;
  String? searchKeyword;
  bool? isFilterActive;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await getUsers(
        pageSize: activePageSize,
        predefinedUserTypeId: selectedPredefinedUserTypeId,
        companyId: selectedCompanyId,
        keyword: searchKeyword);

    _refreshController.refreshCompleted();
  }

  void _loadMoreData() async {
    if (users.length < 5) return;
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    await Future.delayed(const Duration(seconds: 1));
    await getUsers(
        pageSize: activePageSize + 5,
        predefinedUserTypeId: selectedPredefinedUserTypeId,
        companyId: selectedCompanyId,
        keyword: searchKeyword);

    if (!mounted) {
      return;
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    selectedPredefinedUserTypeId = null;
    selectedCompanyId = null;
    isFilterActive = false;
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getUsers(pageSize: activePageSize);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> getUsers(
      {required int pageSize,
      int? predefinedUserTypeId,
      int? companyId,
      String? keyword}) async {
    try {
      EasyLoading.show(status: "Loading..");

      if (mounted) {
        setState(() {
          activePageSize = pageSize;
        });
      }
      if (widget.companyId == null) return;

      final userResult = await _apiService.getUsers(
          page: 1,
          pageSize: pageSize,
          active: null,
          companyIds: [widget.companyId ?? 0],
          predefinedUserTypeIds: [predefinedUserTypeId ?? 0],
          keyword: keyword);

      EasyLoading.dismiss();

      if (userResult == null) {
        _loggerService.writeLog(
            "getUsers: Unable to get users", LogMessageLevel.error);
        showErrorDialog(context, "Unable to get users");

        return;
      } else if (!userResult.success) {
        _loggerService.writeLog(
            "getUsers: no data found - ${userResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context, "No users data found: ${userResult.errorMsg}");
        return;
      }

      if (mounted) {
        setState(() {
          users = userResult.result?.model ?? [];
        });
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();

      _loggerService.writeLog("getUsers: Unable to get users",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to get users");
    }
  }

  Future<void> onSearchUser({
    int? sPredefinedUserTypeId,
    int? sCompanyId,
    String? keyword,
  }) async {
    if (mounted) {
      setState(() {
        isFilterActive = true;
        selectedPredefinedUserTypeId = sPredefinedUserTypeId;
        selectedCompanyId = sCompanyId;
        searchKeyword = keyword;
      });
    }
    await getUsers(
        pageSize: activePageSize,
        predefinedUserTypeId: selectedPredefinedUserTypeId,
        companyId: selectedCompanyId,
        keyword: searchKeyword);
  }

  Future<void> onResetUser() async {
    if (mounted) {
      setState(() {
        isFilterActive = false;

        selectedPredefinedUserTypeId = null;
        selectedCompanyId = null;
        searchKeyword = null;
      });
    }
    await getUsers(
      pageSize: activePageSize,
    );
  }

  Future<void> onDeleteUser(UserModel? user) async {
    var confirmation = await showConfirmationDialog(context, "Confirmation",
        "Are you sure, you want to delete user - ${user?.userName}");
    if (confirmation) {
      try {
        EasyLoading.show(status: "Loading..");
        if (user == null) {
          return showErrorDialog(context, "user Code is required");
        }

        final userDeleteResult =
            await _apiService.markUserAsDeleted(id: user.userId);

        EasyLoading.dismiss();

        if (userDeleteResult == null) {
          _loggerService.writeLog(
              "deleteUser: Unable to delete user", LogMessageLevel.error);
          showErrorDialog(context, "Unable to delete user");

          return;
        } else if (!userDeleteResult.success) {
          _loggerService.writeLog(
              "deleteUser: Unable to delete user - ${userDeleteResult.errorMsg}",
              LogMessageLevel.error);
          showErrorDialog(
              context, "Unable to delete user - ${userDeleteResult.errorMsg}");
          return;
        }

        await showSuccessDialog(context, "Successfully user deleted");
        onResetUser();
      } catch (e, stackTrace) {
        EasyLoading.dismiss();
        _loggerService.writeLog("createUser: Unable to delete user",
            LogMessageLevel.error, e, stackTrace);
        showErrorDialog(context, "Unable to delete user");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("users"),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserCrudScreen(
                                companyId: widget.companyId,
                                isCreateMode: true,
                                isEditMode: false,
                                isViewMode: false,
                                movieId: widget.movieId,
                                title: "Create user",
                                onSubmitCallback: (value) {
                                  onResetUser();
                                },
                                key: widget.key,
                              )));
                },
                icon: Icon(Icons.add))
          ],
        ),
        leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_arrow_left_outlined)),
      ),
      backgroundColor: ThemeColor.lightGreyTwo,
      body: Expanded(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: CustomHeader(
            builder: (context, mode) {
              Widget body;
              if (mode == RefreshStatus.idle) {
                body = Text("pull down refresh");
              } else if (mode == RefreshStatus.refreshing) {
                body = Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      color: ThemeColor.mainThemeColor,
                      animating: true,
                      radius: 15,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Loading.."),
                  ],
                );
              } else if (mode == RefreshStatus.failed) {
                body = Text("refresh Failed!Click retry!");
              } else if (mode == RefreshStatus.canRefresh) {
                body = Text("release to refresh");
              } else {
                body = Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      color: ThemeColor.mainThemeColor,
                      animating: true,
                      radius: 15,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Loading.."),
                  ],
                );
              }
              return Container(height: 55.0, child: Center(child: body));
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SearchTextField(
                      width: 290.w,
                      height: 40.h,
                      innerWidth: 200.w,
                      label: "Search for something",
                      controller: _controller,
                      onSearchValue: (value) {
                        onSearchUser(keyword: value);
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: isFilterActive == true
                              ? ThemeColor.mainThemeColor
                              : Colors.transparent,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      width: 40.w,
                      height: 35.h,
                      child: IconButton(
                          onPressed: () {
                            showUserFilterWidget(
                              context: context,
                              movieId: widget.movieId,
                              companyId: widget.companyId,
                              predefinedUserTypeId:
                                  selectedPredefinedUserTypeId,
                              onResetFilter: () {
                                onResetUser();
                              },
                              onSubmitFilter: ({
                                selectedPredefinedUserTypeId,
                                selectedCompanyId,
                              }) {
                                onSearchUser(
                                  sPredefinedUserTypeId:
                                      selectedPredefinedUserTypeId,
                                  sCompanyId: selectedCompanyId,
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.filter_list_outlined,
                            color: isFilterActive == true
                                ? Colors.white
                                : Colors.black87,
                          )),
                    ),
                  ],
                ),
              ),
              if (users.isNotEmpty) ...[
                Expanded(
                  child: InfiniteList(
                    itemCount: users.length,
                    isLoading: _isLoading,
                    onFetchData: _loadMoreData,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return UserListItemWidget(
                        movieId: widget.movieId,
                        companyId: widget.companyId,
                        user: users[index],
                        key: widget.key,
                        onSubmitCallback: (value) {
                          onResetUser();
                        },
                        onDeleteCallback: ({required UserModel? user}) {
                          onDeleteUser(user);
                        },
                      );
                    },
                  ),
                ),
              ] else ...[
                SizedBox(
                  height: 50.h,
                ),
                const Expanded(
                    child: SingleChildScrollView(
                  child: NoDataFoundWidget(canShowMessage: true),
                )),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
