import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/loader/spinner_widget.dart';
import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/model/framework_model.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/framework/services/real_time_communication/real_time_communication_service.dart';
import 'package:astro_mobile/models/app_custom_enums.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ChatMessageView extends StatefulWidget {
  ChatModel? selectedChat;
  int companyId;
  LoggedInUserModel? userModel;
  ChatMessageView(
      {super.key,
      required this.selectedChat,
      required this.companyId,
      required this.userModel});

  @override
  State<ChatMessageView> createState() => _ChatMessageViewState();
}

class _ChatMessageViewState extends State<ChatMessageView> {
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  final GetIt _getIt = GetIt.instance;
  late final RealTimeCommunicationService _realTimeCommunicationService;
  final TextEditingController _controller = TextEditingController();
  List<types.Message> userChatMessages = [];
  bool isChatMessageLoading = false;
  types.TextMessage? _repliedMessage; // Store the message being replied to
  types.User? _user;

  List<Status> chatMenuOptions = [
    Status(id: ChatMenuOptions.addChatUser.value, type: "Add User"),
    Status(id: ChatMenuOptions.muteChatGroup.value, type: "Mute"),
    Status(id: ChatMenuOptions.clearAllMessage.value, type: "Clear"),
  ];

  @override
  void initState() {
    super.initState();
    _apiService = _getIt<ApiService>();
    _loggerService = _getIt<LoggerService>();
    _realTimeCommunicationService = _getIt<RealTimeCommunicationService>();
    _user = types.User(
        id: widget.userModel?.userId?.toString() ?? "",
        firstName: widget.userModel?.firstName,
        lastName: widget.userModel?.lastName);
    initializeConfiguration();
  }

  Future<void> initializeConfiguration() async {
    /// signalr initialization
    try {
      await getChatMessages(
          pageSize: 10, chatId: widget.selectedChat?.chatId ?? 0);
      await _realTimeCommunicationService.initializeSignalRConnection();
      await _realTimeCommunicationService.startConnection();
      await _listenSignalrMessage();
    } catch (e, stackTrace) {
      _loggerService.writeLog("Initialize Realtime Configuration Error",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to initialize realtime service");
    }
  }

  Future<void> getChatMessages({
    required int pageSize,
    required int chatId,
  }) async {
    try {
      setState(() {
        isChatMessageLoading = true;
      });

      var chatMessagesResult = await _apiService.getChatMessages(
        companyId: widget.companyId,
        pageSize: pageSize,
        chatId: chatId,
        sortBy: 'createdDate',
        sortAscending: false,
      );

      setState(() {
        isChatMessageLoading = false;
      });

      if (chatMessagesResult == null) {
        _loggerService.writeLog(
            "getChats: Unable to get chats", LogMessageLevel.error);
        showErrorDialog(context, "Unable to get chats");

        return;
      } else if (!chatMessagesResult.success) {
        _loggerService.writeLog(
            "getChats: no data found - ${chatMessagesResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(
            context, "No chats data found: ${chatMessagesResult.errorMsg}");
        return;
      }

      setState(() {
        var messageList = chatMessagesResult.result?.model ?? [];
        userChatMessages = [];
        if (messageList.isNotEmpty) {
          for (var item in messageList) {
            var chatMsg = types.TextMessage(
              id: item.chatMessageId?.toString() ?? "",
              author: types.User(
                id: item.userId?.toString() ?? "",
                firstName: item.createdByUserFirstName,
                lastName: item.createdByUserLastName,
              ),
              type: types.MessageType.text,
              status: item.createdByUserId == widget.userModel?.userId
                  ? types.Status.sent
                  : types.Status.delivered,
              createdAt: item.createdDate?.millisecondsSinceEpoch,
              text: item.chatMessageText ?? "",
            );

            userChatMessages.add(chatMsg);
          }
        }
      });
    } catch (e, stackTrace) {
      _loggerService.writeLog("getChatMessages: Unable to get Chat messages",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to get Chat messages");
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      userChatMessages.insert(0, message);
    });
  }

  Future<void> createChatMessage({
    required int chatId,
    required int companyId,
    required String messageText,
    required int userId,
  }) async {
    try {
      var chatMessage = ChatMessageCreateModel(
        chatId: chatId,
        companyId: companyId,
        chatMessageText: messageText,
        userId: userId,
      );

      var chatMessagesResult = await _apiService.createChatMessage(
          chatMessageCreateModel: chatMessage);

      if (chatMessagesResult == null) {
        _loggerService.writeLog(
            "createChatMessage: Unable to send message", LogMessageLevel.error);
        showErrorDialog(context, "Unable to send message");

        return;
      } else if (!chatMessagesResult.success) {
        _loggerService.writeLog(
            "createChatMessage: Unable to send message - ${chatMessagesResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(
            context, "Unable to send message: ${chatMessagesResult.errorMsg}");
        return;
      }

      _realTimeCommunicationService.sendMessage(
          chatMessageId: chatMessagesResult.result?.model?.chatMessageId ?? 0);
    } catch (e, stackTrace) {
      _loggerService.writeLog("createChatMessage: Unable to send message",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to send message");
    }
  }

  Future<void> _listenSignalrMessage() async {
    _realTimeCommunicationService.receiveMessage(
      (ChatMessageModel? message) {
        if (message != null) {
          final textMessage = types.TextMessage(
            id: message.chatMessageId?.toString() ?? "",
            author: types.User(
              id: widget.userModel?.userId?.toString() ?? "",
              firstName: message.createdByUserFirstName,
              lastName: message.createdByUserLastName,
            ),
            type: types.MessageType.text,
            status: message.createdByUserId == widget.userModel?.userId
                ? types.Status.sent
                : types.Status.delivered,
            createdAt: message.createdDate?.millisecondsSinceEpoch,
            text: message.chatMessageText ?? "",
          );
          _addMessage(textMessage);
        }
      },
    );
    // Implement your SignalR message listening logic here
  }

  void _listenChangeChatGroupName() {
    // Implement your SignalR group name change listening logic here
  }

  void _listenChatMessageDeleted() {
    // Implement your SignalR chat message deletion listening logic here
  }

  void _listenNewChatUsersAdded() {
    // Implement your SignalR new chat users addition listening logic here
  }

  void _listenChatDeleted() {
    // Implement your SignalR chat deletion listening logic here
  }

  void _listenChatAdded() {
    // Implement your SignalR new chat addition listening logic here
  }

  void _listenChatUserDeleted() {
    // Implement your SignalR chat user deletion listening logic here
  }

  Future<void> submitMessage(
      types.PartialText message, int userId, int chatId, int companyId) async {
    try {
      var createMessage = ChatMessageCreateModel(
        userId: userId,
        chatId: chatId,
        chatMessageText: message.text,
        companyId: companyId,
      );

      var sendMessageResult = await _apiService.createChatMessage(
          chatMessageCreateModel: createMessage);

      if (sendMessageResult == null) {
        _loggerService.writeLog(
            "getEquipments: Unable to get Equipments", LogMessageLevel.error);
        showErrorDialog(context, "Unable to get Equipments");

        return;
      } else if (!sendMessageResult.success) {
        _loggerService.writeLog(
            "getEquipments: no data found - ${sendMessageResult.errorMsg}",
            LogMessageLevel.error);
        showErrorDialog(
            context, "No Equipments data found: ${sendMessageResult.errorMsg}");
        return;
      }

      if (mounted) {
        setState(() {
          //
        });
      }
    } catch (e, stackTrace) {
      _loggerService.writeLog("getequipments: Unable to get Equipments",
          LogMessageLevel.error, e, stackTrace);
      showErrorDialog(context, "Unable to get Equipments");
    }
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user!,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user!,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index = userChatMessages
              .indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (userChatMessages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            userChatMessages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index = userChatMessages
              .indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (userChatMessages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            userChatMessages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index =
        userChatMessages.indexWhere((element) => element.id == message.id);
    final updatedMessage =
        (userChatMessages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      userChatMessages[index] = updatedMessage;
    });
  }

  Future<void> _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    await createChatMessage(
        chatId: widget.selectedChat?.chatId ?? 0,
        companyId: widget.companyId,
        messageText: message.text,
        userId: widget.userModel?.userId ?? 0);
  }

  void _handleMessageLongPress(types.Message message) {
    if (message is types.TextMessage) {
      setState(() {
        _repliedMessage = message; // Set the message being replied to
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.mainThemeColor,
          leading: Container(),
          leadingWidth: 0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: ThemeColor.lightGrey,
                    backgroundImage: widget.selectedChat?.isGroup == true
                        ? const AssetImage(AppImageAssets.userGroupIcon)
                        : const AssetImage(AppImageAssets.profileImage),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.selectedChat?.chatName}",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Active",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: _user != null
            ? Chat(
                messages: userChatMessages,
                onSendPressed: _handleSendPressed,
                onMessageLongPress: (context, p1) {},
                theme: DefaultChatTheme(
                  backgroundColor: Colors.white,
                  // deliveredIcon: Icon(Icons.check),
                  // documentIcon: Icon(Icons.file_open),
                  // errorIcon: Icon(
                  //   Icons.error,
                  // ),
                  // attachmentButtonIcon: Icon(Icons.file_present),
                  // attachmentButtonMargin: EdgeInsets.all(10),
                  // bubbleMargin: EdgeInsets.all(10),
                  // dateDividerMargin: EdgeInsets.all(10),
                  // dateDividerTextStyle: TextStyle(),
                  // emptyChatPlaceholderTextStyle: TextStyle(),
                  // errorColor: Colors.red,
                  // inputBackgroundColor: ThemeColor.mainThemeColor,
                  // inputSurfaceTintColor: ThemeColor.mainThemeColor,
                  // inputElevation: 10,
                  // inputBorderRadius: BorderRadius.all(Radius.circular(10)),
                  // inputContainerDecoration: BoxDecoration(),
                  // inputMargin: EdgeInsets.all(10),
                  // inputPadding: EdgeInsets.all(10),
                  // inputTextColor: ThemeColor.mainThemeColor,
                  // inputTextCursorColor: ThemeColor.mainThemeColor,
                  // inputTextDecoration: InputDecoration(),
                  // inputTextStyle: TextStyle(),
                  // messageBorderRadius: 12,
                  // messageInsetsHorizontal: 4,
                  // messageInsetsVertical: 5,
                  // messageMaxWidth: 5,
                  // primaryColor: ThemeColor.mainThemeColor,
                  // receivedEmojiMessageTextStyle: TextStyle(),
                  // receivedMessageBodyBoldTextStyle: TextStyle(),
                  // receivedMessageBodyCodeTextStyle: TextStyle(),
                  // receivedMessageBodyLinkTextStyle: TextStyle(),
                  // receivedMessageBodyTextStyle: TextStyle(),
                  // receivedMessageCaptionTextStyle: TextStyle(),
                  // receivedMessageDocumentIconColor: ThemeColor.mainThemeColor,
                  // receivedMessageLinkDescriptionTextStyle: TextStyle(),
                  // receivedMessageLinkTitleTextStyle: TextStyle(),
                  // secondaryColor: Colors.white,
                  // seenIcon: Icon(Icons.remove_red_eye_outlined),
                  // sendButtonIcon: Icon(Icons.check),
                  // sendButtonMargin: EdgeInsets.all(10),
                  // sendingIcon: Icon(Icons.more_horiz),
                  // sentEmojiMessageTextStyle: TextStyle(),
                  // sentMessageBodyBoldTextStyle: TextStyle(),
                  // sentMessageBodyCodeTextStyle: TextStyle(),
                  // sentMessageBodyLinkTextStyle: TextStyle(),
                  // sentMessageBodyTextStyle: TextStyle(),
                  // sentMessageCaptionTextStyle: TextStyle(),
                  // sentMessageDocumentIconColor: Colors.blueAccent,
                  // sentMessageLinkDescriptionTextStyle: TextStyle(),
                  // sentMessageLinkTitleTextStyle: TextStyle(),
                  // statusIconPadding: EdgeInsets.all(10),
                  // systemMessageTheme: SystemMessageTheme(
                  //     margin: EdgeInsets.all(10), textStyle: TextStyle()),
                  // typingIndicatorTheme: TypingIndicatorTheme(
                  //     animatedCirclesColor: ThemeColor.mainThemeColor,
                  //     animatedCircleSize: 32,
                  //     bubbleBorder: BorderRadius.circular(23),
                  //     bubbleColor: ThemeColor.mainThemeColor,
                  //     countAvatarColor: ThemeColor.mainThemeColor,
                  //     countTextColor: ThemeColor.mainThemeColor,
                  //     multipleUserTextStyle: TextStyle()),
                  // unreadHeaderTheme: UnreadHeaderTheme(
                  //     color: ThemeColor.mainThemeColor, textStyle: TextStyle()),
                  // userAvatarImageBackgroundColor: ThemeColor.mainThemeColor,
                  // userAvatarNameColors: [ThemeColor.mainThemeColor],
                  // userAvatarTextStyle: TextStyle(),
                  // userNameTextStyle: TextStyle(),
                  // highlightMessageColor: ThemeColor.mainThemeColor,
                ),
                textMessageOptions: TextMessageOptions(
                  isTextSelectable: true,
                ),
                user: _user!)
            : spinnerWidget(),
      );
}
