import 'package:astro_mobile/api/generated/code/astroclass.swagger.dart';
import 'package:astro_mobile/common_widget/styles/content_style.dart';
import 'package:astro_mobile/pages/screens/user/user_crud_screen.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

typedef onUserDeleteCallback = void Function({required UserModel? user});

class UserListItemWidget extends StatefulWidget {
  UserModel? user;
  int? companyId;
  onUserDeleteCallback onDeleteCallback;
  UserOnSubmitCallBack onSubmitCallback;
  UserListItemWidget(
      {super.key,
      required this.user,
      required this.companyId,
      required this.onDeleteCallback,
      required this.onSubmitCallback});

  @override
  State<UserListItemWidget> createState() => _UserListItemWidgetState();
}

class _UserListItemWidgetState extends State<UserListItemWidget> {
  goGoEditPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UserCrudScreen(
                  companyId: widget.companyId,
                  title: "Edit user",
                  isEditMode: true,
                  isViewMode: false,
                  isCreateMode: false,
                  user: widget.user,
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
            builder: (context) => UserCrudScreen(
                  companyId: widget.companyId,
                  isEditMode: false,
                  title: "View user",
                  isViewMode: true,
                  isCreateMode: false,
                  user: widget.user,
                  onSubmitCallback: (value) {
                    widget.onSubmitCallback(value);
                  },
                  key: widget.key,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ContentStyle.contentSmallPadding,
      child: Slidable(
        direction: Axis.horizontal,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: (context) {
                widget.onDeleteCallback(user: widget.user);
              },
              backgroundColor: ThemeColor.mainThemeColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  goGoEditPage();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: ThemeColor.mainThemeLightColorFour,
                      border: Border(
                          top: BorderSide(color: ThemeColor.lightGrey),
                          left: BorderSide(color: ThemeColor.lightGrey),
                          right: BorderSide(color: ThemeColor.lightGrey)),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: .5.sw,
                            child: Text(
                              widget.user?.userName ?? "",
                              textScaler: CustomTextScaler.headerThree,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.keyboard_arrow_right,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: ThemeColor.lightGrey,
                        ),
                        left: BorderSide(color: ThemeColor.lightGrey),
                        right: BorderSide(color: ThemeColor.lightGrey)),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 150.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Placeholder(
                                    child: Text("Not Implemented UserGuid")),
                                Text("UserName"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.userName ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Predefined User Type"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.predefinedUserTypeName ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Email"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.email ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("FirstName"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.firstName ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("LastName"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.lastName ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("WorkPhone"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.workPhone ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("WorkPhoneExt"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.workPhoneExt ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("CellPhone"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.cellPhone ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Active"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.active.toString() ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented NotificationThroughEmail")),
                                const Placeholder(
                                    child:
                                        Text("Not Implemented OneTimeToken")),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented OneTimeExpireDateTime")),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented LoginFailedAttempt")),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented IsAccountLocked")),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented AccountLockedUntil")),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented NewUserActivationGuid")),
                                const Placeholder(
                                    child: Text(
                                        "Not Implemented NewUserActivationCompletedOn")),
                                Text("Can Configure Company"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.canConfigureCompany.toString() ??
                                      "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Can View Company"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.canViewCompany.toString() ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Company"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.user?.companyName ?? "",
                                  textScaler: TextScaler.linear(1.2.sp),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
