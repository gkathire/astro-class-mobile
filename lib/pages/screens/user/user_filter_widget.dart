import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:astro_mobile/api/services/select-service.dart';
import 'package:astro_mobile/common_widget/styles/button_style.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/model/framework_model.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../themedata/custom_text_scaler.dart';

typedef OnTabUserSubmitFilter = void Function({
  int? selectedPredefinedUserTypeId,
  int? selectedCompanyId,
});
typedef OnTabUserResetFilter = void Function();
Future<dynamic> showUserFilterWidget({
  required BuildContext context,
  required OnTabUserSubmitFilter onSubmitFilter,
  required OnTabUserResetFilter onResetFilter,
  required int? companyId,
  required int? movieId,
  required int? predefinedUserTypeId,
}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          color: ThemeColor.white,
          height: 0.40.sh,
          width: 1.sw,
          child: UserFilterWidget(
            movieId: movieId,
            companyId: companyId,
            selectedPredefinedUserTypeId: predefinedUserTypeId,
            selectedCompanyId: companyId,
            onSubmitFilter: ({
              selectedPredefinedUserTypeId,
              selectedCompanyId,
            }) {
              onSubmitFilter(
                selectedPredefinedUserTypeId: selectedPredefinedUserTypeId,
                selectedCompanyId: selectedCompanyId,
              );
            },
            onResetFilter: () {
              onResetFilter();
            },
          ),
        );
      });
}

class UserFilterWidget extends StatefulWidget {
  final OnTabUserSubmitFilter onSubmitFilter;
  final int? companyId;
  final OnTabUserResetFilter onResetFilter;
  final int? movieId;
  final int? selectedPredefinedUserTypeId;
  final int? selectedCompanyId;
  const UserFilterWidget({
    super.key,
    required this.onSubmitFilter,
    required this.onResetFilter,
    required this.companyId,
    required this.movieId,
    required this.selectedPredefinedUserTypeId,
    required this.selectedCompanyId,
  });

  @override
  State<UserFilterWidget> createState() => _UserFilterWidgetState();
}

class _UserFilterWidgetState extends State<UserFilterWidget> {
  GetIt getIt = GetIt.instance;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final SelectService _selectService;
  final _formKey = GlobalKey<FormState>();

  List<Status>? predefinedUserTypes = [];
  Status? selectedPredefinedUserType;

  @override
  initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    _selectService = getIt<SelectService>();

    predefinedUserTypes = _selectService.GetPredefinedUserTypes();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadInitialData();
    });
  }

  Future<void> loadInitialData() async {
    EasyLoading.show(status: "Loading..");

    EasyLoading.dismiss();
  }

  applyFilter() {
    widget.onSubmitFilter(
      selectedPredefinedUserTypeId: selectedPredefinedUserType?.id,
    );
    Navigator.pop(context);
  }

  resetFilter() {
    if (mounted) {
      setState(() {
        selectedPredefinedUserType = null;
      });
    }
    widget.onResetFilter();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User Type"),
                SizedBox(height: 10.h),
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
                  onChanged: (Status? newValue) {
                    setState(() {
                      selectedPredefinedUserType = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: cancelButtonStyle(),
                onPressed: () {
                  resetFilter();
                },
                child: const Text(
                  "Reset",
                  textScaler: CustomTextScaler.headerTwo,
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              TextButton(
                style: submitButtonStyle(),
                onPressed: () {
                  applyFilter();
                },
                child: const Text(
                  "Apply Filter",
                  textScaler: CustomTextScaler.headerTwo,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
