import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/framework/model/framework_model.dart';
import 'package:astro_mobile/models/app_custom_enums.dart';
import 'package:astro_mobile/pages/screens/chat/chat_crud_screen.dart';
import 'package:astro_mobile/themedata/custom_text_scaler.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'chat_message-view.dart';

typedef onChatDeleteCallback = void Function({required ChatModel? chat});

class ChatListItemWidget extends StatefulWidget {
  ChatModel? chat;
  int? movieId;
  int? companyId;
  LoggedInUserModel? userModel;
  onChatDeleteCallback onDeleteCallback;
  ChatOnSubmitCallBack onSubmitCallback;
  ChatListItemWidget(
      {super.key,
      required this.chat,
      required this.movieId,
      required this.userModel,
      required this.companyId,
      required this.onDeleteCallback,
      required this.onSubmitCallback});

  @override
  State<ChatListItemWidget> createState() => _ChatListItemWidgetState();
}

class _ChatListItemWidgetState extends State<ChatListItemWidget> {
  List<Status> chatItemGroupMenuOptions = [
    Status(id: ChatGroupItemMenuOptions.addChatUser.value, type: "Add User"),
    Status(
        id: ChatGroupItemMenuOptions.removeGroup.value, type: "Remove group"),
    Status(
        id: ChatGroupItemMenuOptions.updateGroupName.value,
        type: "Update Group Name"),
  ];

  goGoEditPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatCrudScreen(
                  companyId: widget.companyId,
                  title: "Edit chat",
                  isEditMode: true,
                  isViewMode: false,
                  isCreateMode: false,
                  chat: widget.chat,
                  movieId: widget.movieId,
                  onSubmitCallback: (value) {
                    widget.onSubmitCallback(value);
                  },
                  key: widget.key,
                )));
  }

  goGoViewPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatCrudScreen(
                  companyId: widget.companyId,
                  isEditMode: false,
                  title: "View chat",
                  isViewMode: true,
                  isCreateMode: false,
                  chat: widget.chat,
                  movieId: widget.movieId,
                  onSubmitCallback: (value) {
                    widget.onSubmitCallback(value);
                  },
                  key: widget.key,
                )));
  }

  void onSearchChatGroups({required String? keyword}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14.r,
                backgroundColor: ThemeColor.lightGrey,
                backgroundImage: widget.chat?.isGroup == true
                    ? const AssetImage(AppImageAssets.userGroupIcon)
                    : const AssetImage(AppImageAssets.profileImage),
              ),
              SizedBox(
                width: 20.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatMessageView(
                                userModel: widget.userModel,
                                companyId: widget.companyId ?? 0,
                                selectedChat: widget.chat,
                                key: widget.key,
                              )));
                  //   child view: action
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        widget.chat?.chatName ?? '',
                        textScaler: CustomTextScaler.headerThree,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(DateFormat('dd MM')
                  .format(widget.chat?.createdDate ?? DateTime.now())),
              PopupMenuButton(
                color: Colors.white,
                elevation: 10,
                itemBuilder: (context) {
                  return chatItemGroupMenuOptions.map((Status value) {
                    return PopupMenuItem<Status>(
                        onTap: () {
                          // onSelectMoreOption(option: value.id ?? -1);
                        },
                        child: Text(value.type));
                  }).toList();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
