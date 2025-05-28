import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';
import 'package:astro_mobile/api/services/select-service.dart';
import 'package:astro_mobile/common_widget/dialogs/error_dialog.dart';
import 'package:astro_mobile/common_widget/dialogs/success_dialog.dart';
import 'package:astro_mobile/common_widget/styles/button_style.dart';
import 'package:astro_mobile/common_widget/styles/text_decoration.dart';
import 'package:astro_mobile/framework/enum/app_enum.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/model/framework_model.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

typedef UserOnSubmitCallBack = void Function(bool? value);

class UserCrudScreen extends StatefulWidget {
  UserOnSubmitCallBack onSubmitCallback;
  int? companyId;
  int? movieId;
  UserModel? user;
  bool isCreateMode;
  bool isEditMode;
  bool isViewMode;
  String title;

  UserCrudScreen(
      {super.key,
      required this.onSubmitCallback,
      required this.companyId,
      required this.movieId,
      this.user,
      required this.isCreateMode,
      required this.isEditMode,
      required this.title,
      required this.isViewMode});

  @override
  State<UserCrudScreen> createState() => _UserCrudScreenState();
}

class _UserCrudScreenState extends State<UserCrudScreen> {
  GetIt getIt = GetIt.instance;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final SelectService _selectService;
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _userGuidFieldController;
  late final TextEditingController _userNameFieldController;
  List<Status>? predefinedUserTypes = [];
  Status? selectedPredefinedUserType;
  late final TextEditingController _passwordHashFieldController;
  DateTime? selectedPasswordChangedDate;
  Key _passwordChangedDateUniqueKey = UniqueKey();
  late final TextEditingController _emailFieldController;
  late final TextEditingController _firstNameFieldController;
  late final TextEditingController _lastNameFieldController;
  late final TextEditingController _workPhoneFieldController;
  late final TextEditingController _workPhoneExtFieldController;
  late final TextEditingController _cellPhoneFieldController;
  bool? _active = false;
  late final TextEditingController _notificationThroughEmailFieldController;
  late final TextEditingController _oneTimeTokenFieldController;
  late final TextEditingController _oneTimeExpireDateTimeFieldController;
  late final TextEditingController _loginFailedAttemptFieldController;
  late final TextEditingController _isAccountLockedFieldController;
  late final TextEditingController _accountLockedUntilFieldController;
  late final TextEditingController _newUserActivationGuidFieldController;
  late final TextEditingController _newUserActivationCompletedOnFieldController;
  bool? _canConfigureCompany = false;
  bool? _canViewCompany = false;
  late final TextEditingController _profileImageLocationFieldController;
  late final TextEditingController _profileImageGuidFieldController;
  late final TextEditingController _profileImageActualFileNameFieldController;

  @override
  initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    _selectService = getIt<SelectService>();

    _userGuidFieldController = TextEditingController();
    _userNameFieldController = TextEditingController();
    predefinedUserTypes = _selectService.GetPredefinedUserTypes();
    _passwordHashFieldController = TextEditingController();
    _emailFieldController = TextEditingController();
    _firstNameFieldController = TextEditingController();
    _lastNameFieldController = TextEditingController();
    _workPhoneFieldController = TextEditingController();
    _workPhoneExtFieldController = TextEditingController();
    _cellPhoneFieldController = TextEditingController();
    _notificationThroughEmailFieldController = TextEditingController();
    _oneTimeTokenFieldController = TextEditingController();
    _oneTimeExpireDateTimeFieldController = TextEditingController();
    _loginFailedAttemptFieldController = TextEditingController();
    _isAccountLockedFieldController = TextEditingController();
    _accountLockedUntilFieldController = TextEditingController();
    _newUserActivationGuidFieldController = TextEditingController();
    _newUserActivationCompletedOnFieldController = TextEditingController();
    _profileImageLocationFieldController = TextEditingController();
    _profileImageGuidFieldController = TextEditingController();
    _profileImageActualFileNameFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadInitialData();
    });
  }

  Future<void> loadInitialData() async {
    EasyLoading.show(status: "Loading..");

    if (!widget.isCreateMode) {
      _userGuidFieldController.text = widget.user?.userGuid ?? "";
      _userNameFieldController.text = widget.user?.userName ?? "";
      selectedPredefinedUserType = predefinedUserTypes
          ?.where((item) => item.id == widget.user?.predefinedUserTypeId)
          .firstOrNull;
      _emailFieldController.text = widget.user?.email ?? "";
      _firstNameFieldController.text = widget.user?.firstName ?? "";
      _lastNameFieldController.text = widget.user?.lastName ?? "";
      _workPhoneFieldController.text = widget.user?.workPhone ?? "";
      _workPhoneExtFieldController.text = widget.user?.workPhoneExt ?? "";
      _cellPhoneFieldController.text = widget.user?.cellPhone ?? "";
      _profileImageActualFileNameFieldController.text =
          widget.user?.profileImageActualFileName ?? "";
    }

    EasyLoading.dismiss();
  }

  Future<void> onSubmit() async {
    try {
      EasyLoading.show(status: "Loading..");

      // validation
      if (_userGuidFieldController.text.isEmpty) {
        return showErrorDialog(context, "User Guid is required");
      }
      if (_userNameFieldController.text.isEmpty) {
        return showErrorDialog(context, "User Name is required");
      }
      predefinedUserTypes = _selectService.GetPredefinedUserTypes();
      if (selectedPredefinedUserType == null) {
        return showErrorDialog(context, "User Type is required");
      }
      if (_passwordHashFieldController.text.isEmpty) {
        return showErrorDialog(context, "Password Hash is required");
      }
      if (selectedPasswordChangedDate == null) {
        return showErrorDialog(context, "Password Changed Date is required");
      }
      if (_emailFieldController.text.isEmpty) {
        return showErrorDialog(context, "Email is required");
      }
      if (_firstNameFieldController.text.isEmpty) {
        return showErrorDialog(context, "First Name is required");
      }
      if (_lastNameFieldController.text.isEmpty) {
        return showErrorDialog(context, "Last Name is required");
      }
      if (_workPhoneFieldController.text.isEmpty) {
        return showErrorDialog(context, "Work Phone is required");
      }
      if (_workPhoneExtFieldController.text.isEmpty) {
        return showErrorDialog(context, "Work Phone Ext is required");
      }
      if (_cellPhoneFieldController.text.isEmpty) {
        return showErrorDialog(context, "Cell Phone is required");
      }
      if (_notificationThroughEmailFieldController.text.isEmpty) {
        return showErrorDialog(
            context, "Notification Through Email is required");
      }
      if (_oneTimeTokenFieldController.text.isEmpty) {
        return showErrorDialog(context, "One Time Token is required");
      }
      if (_oneTimeExpireDateTimeFieldController.text.isEmpty) {
        return showErrorDialog(
            context, "One Time Expire Date Time is required");
      }
      if (_loginFailedAttemptFieldController.text.isEmpty) {
        return showErrorDialog(context, "Login Failed Attempt is required");
      }
      if (_isAccountLockedFieldController.text.isEmpty) {
        return showErrorDialog(context, "Is Account Locked is required");
      }
      if (_accountLockedUntilFieldController.text.isEmpty) {
        return showErrorDialog(context, "Account Locked Until is required");
      }
      if (_newUserActivationGuidFieldController.text.isEmpty) {
        return showErrorDialog(context, "New User Activation Guid is required");
      }
      if (_newUserActivationCompletedOnFieldController.text.isEmpty) {
        return showErrorDialog(
            context, "New User Activation Completed On is required");
      }
      if (_profileImageLocationFieldController.text.isEmpty) {
        return showErrorDialog(context, "Profile Image Location is required");
      }
      if (_profileImageGuidFieldController.text.isEmpty) {
        return showErrorDialog(context, "Profile Image Guid is required");
      }
      if (_profileImageActualFileNameFieldController.text.isEmpty) {
        return showErrorDialog(
            context, "Profile Image Actual File Name is required");
      }

      if (widget.isCreateMode) {
        final userCreationResult = await _apiService.createUser(
          companyId: widget.companyId,
        );

        EasyLoading.dismiss();

        if (userCreationResult == null) {
          _loggerService.writeLog(
              "createUser: Unable to create user", LogMessageLevel.error);
          showErrorDialog(context, "Unable to create user");

          return;
        } else if (!userCreationResult.success) {
          _loggerService.writeLog(
              "createUser: Unable to create user - ${userCreationResult.errorMsg}",
              LogMessageLevel.error);
          showErrorDialog(context,
              "Unable to create user - ${userCreationResult.errorMsg}");
          return;
        }

        await showSuccessDialog(context, "Successfully movie scene created");
        widget.onSubmitCallback(true);
        navigateToListView();
      } else if (widget.isEditMode) {
        final userUpdateResult = await _apiService.updateUser(
          companyId: widget.companyId,
          userId: widget.user?.userId,
        );

        EasyLoading.dismiss();

        if (userUpdateResult == null) {
          _loggerService.writeLog(
              "createUser: Unable to update user", LogMessageLevel.error);
          showErrorDialog(context, "Unable to update user");

          return;
        } else if (!userUpdateResult.success) {
          _loggerService.writeLog(
              "updateUser: Unable to update user - ${userUpdateResult.errorMsg}",
              LogMessageLevel.error);
          showErrorDialog(
              context, "Unable to update user - ${userUpdateResult.errorMsg}");
          return;
        }

        await showSuccessDialog(context, "Successfully movie scene updated");
        widget.onSubmitCallback(true);
        navigateToListView();
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      _loggerService.writeLog(
          "createUser: Unable to ${widget.isCreateMode ? "create" : "update"} user",
          LogMessageLevel.error,
          e,
          stackTrace);
      showErrorDialog(context,
          "Unable to  ${widget.isCreateMode ? "create" : "update"} user");
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
                    Text("User Name"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _userNameFieldController,
                        keyboardType: TextInputType.name,
                        decoration:
                            appTextDefaultDecoration(hintText: "User Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'User Name is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.userName ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("User Type"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      DropdownButtonFormField2<Status>(
                        isExpanded: false,
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        value: selectedPredefinedUserType,
                        hint: const Text("Select User Type"),
                        items: predefinedUserTypes?.map((item) {
                          return DropdownMenuItem<Status>(
                            value: item,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              item.type ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'User Type is required';
                          }
                          return null;
                        },
                        onChanged: (Status? newValue) {
                          setState(() {
                            selectedPredefinedUserType = newValue;
                          });
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.predefinedUserTypeName ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Email"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _emailFieldController,
                        keyboardType: TextInputType.name,
                        decoration: appTextDefaultDecoration(hintText: "Email"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.email ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("First Name"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _firstNameFieldController,
                        keyboardType: TextInputType.name,
                        decoration:
                            appTextDefaultDecoration(hintText: "First Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First Name is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.firstName ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Last Name"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _lastNameFieldController,
                        keyboardType: TextInputType.name,
                        decoration:
                            appTextDefaultDecoration(hintText: "Last Name"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last Name is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.lastName ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Work Phone"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _workPhoneFieldController,
                        keyboardType: TextInputType.name,
                        decoration:
                            appTextDefaultDecoration(hintText: "Work Phone"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Work Phone is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.workPhone ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Work Phone Ext"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _workPhoneExtFieldController,
                        keyboardType: TextInputType.name,
                        decoration: appTextDefaultDecoration(
                            hintText: "Work Phone Ext"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Work Phone Ext is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.workPhoneExt ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    Text("Cell Phone"),
                    SizedBox(height: 10.h),
                    if (!widget.isViewMode) ...[
                      TextFormField(
                        controller: _cellPhoneFieldController,
                        keyboardType: TextInputType.name,
                        decoration:
                            appTextDefaultDecoration(hintText: "Cell Phone"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Cell Phone is required';
                          }
                          return null;
                        },
                      ),
                    ] else ...[
                      Text(widget.user?.cellPhone ?? ""),
                    ],
                    SizedBox(
                      height: 20.h,
                    ),
                    if (!widget.isCreateMode) ...[
                      CheckboxListTile(
                        title: Text("Active"),
                        value: _active,
                        onChanged: (bool? value) {
                          setState(() {
                            _active = value;
                          });
                        },
                      ),
                    ],
                    CheckboxListTile(
                      title: Text("Can Configure Company"),
                      value: _canConfigureCompany,
                      onChanged: (bool? value) {
                        setState(() {
                          _canConfigureCompany = value;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text("Can View Company"),
                      value: _canViewCompany,
                      onChanged: (bool? value) {
                        setState(() {
                          _canViewCompany = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.h,
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
