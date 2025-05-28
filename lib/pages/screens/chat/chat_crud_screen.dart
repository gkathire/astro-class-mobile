import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/api/services/select-service.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/dialogs/success_dialog.dart';
import 'package:astro_mobile/common_widget/styles/button_style.dart';
import 'package:astro_mobile/common_widget/styles/text_decoration.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/themedata/custom_text_scaler.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

typedef ChatOnSubmitCallBack = void Function(bool? value);

class ChatCrudScreen extends StatefulWidget {
  ChatOnSubmitCallBack onSubmitCallback;
  int? companyId;
  int? movieId;
  ChatModel? chat;
  bool isCreateMode;
  bool isEditMode;
  bool isViewMode;
  String title;

  ChatCrudScreen(
      {super.key,
      required this.onSubmitCallback,
      required this.companyId,
      required this.movieId,
      this.chat,
      required this.isCreateMode,
      required this.isEditMode,
      required this.title,
      required this.isViewMode});

  @override
  State<ChatCrudScreen> createState() => _ChatCrudScreenState();
}

class ChatUserSelectedModel {
  bool isUserSelected;
  UserModel userModel;
  ChatUserSelectedModel(this.isUserSelected, this.userModel);
}

class _ChatCrudScreenState extends State<ChatCrudScreen> {
  GetIt getIt = GetIt.instance;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final SelectService _selectService;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _chatNameFieldController;
  late final TextEditingController _chatUserName;
  List<types.Message> chatMessageList = [];
  List<UserModel> userList = [];
  Map<int, bool> selectedUserItems = {}; // Stores selection state

  // Map<int, ChatUserSelectedModel> selectedUserItems =
  // {}; // Stores selection state
  @override
  initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    _selectService = getIt<SelectService>();

    _chatNameFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadInitialData();
    });
  }

  Future<void> loadInitialData() async {
    EasyLoading.show(status: "Loading..");

    if (!widget.isCreateMode) {
      _chatNameFieldController.text = widget.chat?.chatName ?? "";
    }
    getUsers(
      pageSize: 10000,
      companyId: widget.companyId,
    );

    EasyLoading.dismiss();
  }

  Future<void> getUsers(
      {required int pageSize,
      int? userId,
      int? predefinedUserTypeId,
      int? companyId,
      String? keyword}) async {
    try {
      EasyLoading.show(status: "Loading..");

      final userResult = await _apiService.getUsers(
          page: 1,
          pageSize: pageSize,
          companyIds: [widget.companyId ?? 0],
          predefinedUserTypeIds:
              predefinedUserTypeId != null ? [predefinedUserTypeId] : null,
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

      setState(() {
        userList = userResult.result?.model ?? [];
      });

      if (userList.isEmpty) {
        showErrorDialog(context, "No user data found. pls configure user");
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();

      _loggerService.writeLog("getUsers: Unable to get users",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to get users");
    }
  }

  Future<void> onSubmit() async {
    try {
      // validation
      if (_chatNameFieldController.text.isEmpty) {
        return showErrorDialog(context, "Chat Name is required");
      }

      List<int> selectedUserIndex = selectedUserItems.entries
          .where((data) => data.value == true)
          .map((entry) => entry.key)
          .toList(); // Get selected items

      if (selectedUserIndex.isEmpty) {
        showErrorDialog(context, "Please select at least one user");
        return;
      }

      if (widget.isCreateMode) {
        List<ChatUserCreateModel> chatUserCreationList = [];

        for (var userIdx in selectedUserIndex) {
          var userInfo = userList[userIdx];
          if (userInfo != null) {
            var createUser = ChatUserCreateModel(
              companyId: widget.companyId,
              userId: userInfo.userId,
            );
            chatUserCreationList.add(createUser);
          }
        }
        var chatCreateModel = ChatCreateModel(
            companyId: widget.companyId,
            chatName: _chatNameFieldController.text,
            newChatUsers: chatUserCreationList);

        EasyLoading.show(status: "Loading..");

        final chatCreationResult =
            await _apiService.createChat(chatCreateModel: chatCreateModel);

        EasyLoading.dismiss();

        if (chatCreationResult == null) {
          _loggerService.writeLog(
              "createChat: Unable to create chat", LogMessageLevel.error);
          showErrorDialog(context, "Unable to create chat");

          return;
        } else if (!chatCreationResult.success) {
          _loggerService.writeLog(
              "createChat: Unable to create chat - ${chatCreationResult.errorMsg}",
              LogMessageLevel.error);
          showErrorDialog(context,
              "Unable to create chat - ${chatCreationResult.errorMsg}");
          return;
        }

        await showSuccessDialog(
            context, "Successfully movie chat group created");

        widget.onSubmitCallback(true);

        navigateToListView();
      } else if (widget.isEditMode) {
        List<ChatUserUpdateModel> chatUserUpdateList = [];

        for (var userId in selectedUserIndex) {
          var createUser = ChatUserUpdateModel(
            companyId: widget.companyId,
            userId: userId,
          );
          chatUserUpdateList.add(createUser);
        }

        for (var userIdx in selectedUserIndex) {
          var userInfo = userList[userIdx];
          if (userInfo != null) {
            var createUser = ChatUserUpdateModel(
              companyId: widget.companyId,
              userId: userInfo.userId,
            );
            chatUserUpdateList.add(createUser);
          }
        }

        var chatUpdateModel = ChatUpdateModel(
          companyId: widget.companyId,
          chatId: widget.chat?.chatId,
          existingChatUsers: chatUserUpdateList,
        );

        EasyLoading.show(status: "Loading..");

        final chatUpdateResult =
            await _apiService.updateChat(chatUpdateModel: chatUpdateModel);

        EasyLoading.dismiss();

        if (chatUpdateResult == null) {
          _loggerService.writeLog(
              "createChat: Unable to update chat", LogMessageLevel.error);
          showErrorDialog(context, "Unable to update chat");

          return;
        } else if (!chatUpdateResult.success) {
          _loggerService.writeLog(
              "updateChat: Unable to update chat - ${chatUpdateResult.errorMsg}",
              LogMessageLevel.error);
          showErrorDialog(
              context, "Unable to update chat - ${chatUpdateResult.errorMsg}");
          return;
        }

        await showSuccessDialog(
            context, "Successfully movie chat group updated");
        widget.onSubmitCallback(true);
        navigateToListView();
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      _loggerService.writeLog(
          "createChat: Unable to ${widget.isCreateMode ? "create" : "update"} chat",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context,
          "Unable to  ${widget.isCreateMode ? "create" : "update"} chat");
    }
  }

  navigateToListView() {
    Navigator.pop(context);
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
              Text(widget.title),
            ],
          ),
          leading: TextButton(
              onPressed: () {
                navigateToListView();
              },
              child: const Icon(Icons.keyboard_arrow_left_outlined)),
        ),
        backgroundColor: ThemeColor.lightGreyTwo,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Chat Group Name"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _chatNameFieldController,
                        keyboardType: TextInputType.name,
                        decoration: appTextDefaultDecoration(
                            hintText: "Chat Group Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Chat Group Name is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.chat?.chatName ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Select User"),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(
                                "${userList[index].firstName} ${userList[index].lastName}"),
                            value: selectedUserItems[index] ?? false,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedUserItems[index] = value ?? false;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    if (!widget.isViewMode) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: submitButtonStyle(),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                onSubmit();
                              }
                            },
                            child: const Text(
                              "Submit",
                              textScaler: CustomTextScaler.normalText,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ],
                ),
              )),
        ));
  }
}
