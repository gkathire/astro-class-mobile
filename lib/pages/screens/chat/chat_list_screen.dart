import 'package:flutter_app/api/generated/code/filmicall.swagger.dart';
import 'package:flutter_app/common_widget/dialogs/confirmation_dialog.dart';
import 'package:flutter_app/common_widget/dialogs/error_dialog.dart';
import 'package:flutter_app/common_widget/dialogs/success_dialog.dart';
import 'package:flutter_app/common_widget/loader/spinner_widget.dart';
import 'package:flutter_app/common_widget/no_data/no_data_found_widget.dart';
import 'package:flutter_app/common_widget/styles/content_style.dart';
import 'package:flutter_app/framework/enum/app_enum.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:flutter_app/framework/model/framework_model.dart';
import 'package:flutter_app/framework/services/api_service.dart';
import 'package:flutter_app/models/app_custom_enums.dart';
import 'package:flutter_app/pages/screens/chat/chat_crud_screen.dart';
import 'package:flutter_app/pages/screens/chat/chat_list_item_widget.dart';
import 'package:flutter_app/pages/widgets/search_text_field.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class ChatListScreen extends StatefulWidget {
  int? companyId;
  int? movieId;
  LoggedInUserModel? userModel;
  ChatListScreen(
      {super.key,
      required this.companyId,
      required this.movieId,
      required this.userModel});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController _controller = TextEditingController();
  GetIt getIt = GetIt.instance;
  String? searchTextValue;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  List<ChatModel> chats = [];
  var _isLoading = false;
  var activePageSize = 20;
  bool? isFilterActive;
  bool isChatListLoading = false;
  List<Status> addChatGroupMenuOptions = [
    Status(
        id: ChatOverallMenuOptions.createNewChatGroup.value,
        type: "Create Chat"),
  ];

  int? selectedCompanyId;
  String? searchKeyword;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await getChats(
        pageSize: activePageSize,
        companyId: selectedCompanyId,
        keyword: searchKeyword);

    _refreshController.refreshCompleted();
  }

  void _loadMoreData() async {
    if (chats.length < 20) return;
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
    await Future.delayed(const Duration(seconds: 1));
    await getChats(
        pageSize: activePageSize + 20,
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

    selectedCompanyId = null;
    isFilterActive = false;
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getChats(pageSize: activePageSize);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSelectCreateChatOption({Status? option}) {
    if (option == null) return;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatCrudScreen(
                  companyId: widget.companyId,
                  isEditMode: false,
                  title: "Create chat group",
                  isViewMode: false,
                  isCreateMode: true,
                  movieId: widget.movieId,
                  onSubmitCallback: (value) {
                    // widget.onSubmitCallback(value);
                  },
                  key: widget.key,
                )));
  }

  Future<void> getChats(
      {required int pageSize, int? companyId, String? keyword}) async {
    try {
      setState(() {
        activePageSize = pageSize;
        isChatListLoading = true;
      });

      final chatResult = await _apiService.getChats(
          page: 1,
          pageSize: pageSize,
          companyId: widget.companyId,
          keyword: keyword);

      setState(() {
        isChatListLoading = false;
      });

      if (chatResult == null) {
        _loggerService.writeLog(
            "getChats: Unable to get chats", LogMessageLevel.error);
        showErrorDialog(context, "Unable to get chats");

        return;
      } else if (!chatResult.success) {
        _loggerService.writeLog(
            "getChats: no data found - ${chatResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(context, "No chats data found: ${chatResult.errorMsg}");
        return;
      }

      setState(() {
        chats = chatResult.result?.model ?? [];
      });
    } catch (e, stackTrace) {
      EasyLoading.dismiss();

      _loggerService.writeLog("getChats: Unable to get chats",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to get chats");
    }
  }

  Future<void> onSearchChat({
    int? sCompanyId,
    String? keyword,
  }) async {
    if (mounted) {
      setState(() {
        isFilterActive = true;
        selectedCompanyId = sCompanyId;
        searchKeyword = keyword;
      });
    }
    await getChats(
        pageSize: activePageSize,
        companyId: selectedCompanyId,
        keyword: searchKeyword);
  }

  Future<void> onResetChat() async {
    if (mounted) {
      setState(() {
        isFilterActive = false;

        selectedCompanyId = null;
        searchKeyword = null;
      });
    }
    await getChats(
      pageSize: activePageSize,
    );
  }

  Future<void> onDeleteChat(ChatModel? chat) async {
    var confirmation = await showConfirmationDialog(context, "Confirmation",
        "Are you sure, you want to delete chat - ${chat?.chatName}");
    if (confirmation) {
      try {
        EasyLoading.show(status: "Loading..");
        if (chat == null) {
          return showErrorDialog(context, "chat Code is required");
        }

        final chatDeleteResult =
            await _apiService.markChatAsDeleted(id: chat.chatId);

        EasyLoading.dismiss();

        if (chatDeleteResult == null) {
          _loggerService.writeLog(
              "deleteChat: Unable to delete chat", LogMessageLevel.error);
          showErrorDialog(context, "Unable to delete chat");

          return;
        } else if (!chatDeleteResult.success) {
          _loggerService.writeLog(
              "deleteChat: Unable to delete chat - ${chatDeleteResult.errorMsg}",
              LogMessageLevel.error);
          showErrorDialog(
              context, "Unable to delete chat - ${chatDeleteResult.errorMsg}");
          return;
        }

        await showSuccessDialog(context, "Successfully chat deleted");
        onResetChat();
      } catch (e, stackTrace) {
        EasyLoading.dismiss();
        _loggerService.writeLog("createChat: Unable to delete chat",
            LogMessageLevel.error, e, stackTrace);
        showErrorDialog(context, "Unable to delete chat");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ContentStyle.contentSmallPadding,
      child: Expanded(
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
              return SizedBox(height: 55.0, child: Center(child: body));
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: isChatListLoading
              ? SizedBox(
                  height: 0.5.sh,
                  child: spinnerWidget(transparent: true),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SearchTextField(
                            width: 270.w,
                            height: 35.h,
                            innerWidth: 200.w,
                            label: "search chat groups here..",
                            controller: _controller,
                            onSearchValue: (value) {
                              onSearchChat(keyword: value);
                            },
                          ),
                          PopupMenuButton(
                            color: Colors.white,
                            elevation: 10,
                            itemBuilder: (context) {
                              return addChatGroupMenuOptions
                                  .map((Status value) {
                                return PopupMenuItem<Status>(
                                    onTap: () {
                                      onSelectCreateChatOption(option: value);
                                    },
                                    child: Text(value.type));
                              }).toList();
                            },
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //       borderRadius: const BorderRadius.all(
                          //           Radius.circular(10))),
                          //   width: 40.w,
                          //   height: 40.h,
                          //   child: IconButton(
                          //       onPressed: () {
                          //                     onSelectCreateChatOption(option: ChatOverallMenuOptions.createNewChatGroup.value);
                          //       },
                          //       icon: Icon(
                          //         size: 25,
                          //         Icons.add,
                          //         color: Colors.black87,
                          //       )),
                          // ),
                        ],
                      ),
                    ),
                    if (chats.isNotEmpty) ...[
                      Expanded(
                        child: InfiniteList(
                          itemCount: chats.length,
                          isLoading: _isLoading,
                          onFetchData: _loadMoreData,
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.grey[300],
                          ),
                          itemBuilder: (context, index) {
                            return ChatListItemWidget(
                              movieId: widget.movieId,
                              companyId: widget.companyId,
                              userModel: widget.userModel,
                              chat: chats[index],
                              key: widget.key,
                              onSubmitCallback: (value) {
                                onResetChat();
                              },
                              onDeleteCallback: ({required chat}) {
                                onDeleteChat(chat);
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
