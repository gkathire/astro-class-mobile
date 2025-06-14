import 'package:astro_mobile/api/services/select-service.dart';
import 'package:astro_mobile/common_widget/styles/button_style.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../api/generated/code/filmicall.swagger.dart';
import '../../../theme_data/custom_text_scaler.dart';

typedef OnTabChatSubmitFilter = void Function({
  int? selectedCompanyId,
});
typedef OnTabChatResetFilter = void Function();
Future<dynamic> showChatFilterWidget({
  required BuildContext context,
  required OnTabChatSubmitFilter onSubmitFilter,
  required OnTabChatResetFilter onResetFilter,
  required int? companyId,
  required int? movieId,
}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          color: ThemeColor.white,
          height: 0.40.sh,
          width: 1.sw,
          child: ChatFilterWidget(
            movieId: movieId,
            companyId: companyId,
            selectedCompanyId: companyId,
            onSubmitFilter: ({
              selectedCompanyId,
            }) {
              onSubmitFilter(
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

class ChatFilterWidget extends StatefulWidget {
  final OnTabChatSubmitFilter onSubmitFilter;
  final int? companyId;
  final OnTabChatResetFilter onResetFilter;
  final int? movieId;
  final int? selectedCompanyId;
  const ChatFilterWidget({
    super.key,
    required this.onSubmitFilter,
    required this.onResetFilter,
    required this.companyId,
    required this.movieId,
    required this.selectedCompanyId,
  });

  @override
  State<ChatFilterWidget> createState() => _ChatFilterWidgetState();
}

class _ChatFilterWidgetState extends State<ChatFilterWidget> {
  GetIt getIt = GetIt.instance;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final SelectService _selectService;
  final _formKey = GlobalKey<FormState>();

  List<CompanyModel>? companys = [];
  CompanyModel? selectedCompany;

  @override
  initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    _selectService = getIt<SelectService>();

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
      selectedCompanyId: selectedCompany?.companyId,
    );
    Navigator.pop(context);
  }

  resetFilter() {
    setState(() {
      selectedCompany = null;
    });
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
                Text("Company"),
                SizedBox(height: 10.h),
                DropdownButtonFormField2<CompanyModel>(
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
                  value: selectedCompany,
                  hint: const Text("Select Company"),
                  items: companys?.map((item) {
                    return DropdownMenuItem<CompanyModel>(
                      value: item,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        item.companyName ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (CompanyModel? newValue) {
                    setState(() {
                      selectedCompany = newValue;
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
