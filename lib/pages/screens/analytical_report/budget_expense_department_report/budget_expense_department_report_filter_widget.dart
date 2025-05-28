import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_app/api/services/select-service.dart';
import 'package:flutter_app/common_widget/styles/button_style.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:flutter_app/framework/model/framework_model.dart';
import 'package:flutter_app/framework/services/api_service.dart';
import 'package:flutter_app/models/app-enums.dart';
import 'package:flutter_app/themedata/custom_text_scaler.dart';
import 'package:flutter_app/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

typedef OnTabMovieBudgetDepartmentReportSubmitFilter = void Function({
  int? selectedPredefinedBudgetDivisionTypeId,
});
typedef OnTabMovieDepartmentResetFilter = void Function();
Future<dynamic> showBudgetExpenseDepartmentFilterWidget({
  required BuildContext context,
  required OnTabMovieBudgetDepartmentReportSubmitFilter onSubmitFilter,
  required OnTabMovieDepartmentResetFilter onResetFilter,
  required int? companyId,
  required int? movieId,
  required int? predefinedBudgetDivisionTypeId,
}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          color: ThemeColor.white,
          height: 0.40.sh,
          width: 1.sw,
          child: MovieBudgetExpenseDepartmentFilterWidget(
            movieId: movieId,
            companyId: companyId,
            selectedPredefinedBudgetDivisionTypeId:
                predefinedBudgetDivisionTypeId,
            onSubmitFilter: ({
              selectedPredefinedBudgetOrExpenseTypeId,
              selectedPredefinedBudgetDivisionTypeId,
            }) {
              onSubmitFilter(
                selectedPredefinedBudgetDivisionTypeId:
                    selectedPredefinedBudgetDivisionTypeId,
              );
            },
            onResetFilter: () {
              onResetFilter();
            },
          ),
        );
      });
}

class MovieBudgetExpenseDepartmentFilterWidget extends StatefulWidget {
  final OnTabMovieBudgetDepartmentReportSubmitFilter onSubmitFilter;
  final int? companyId;
  final OnTabMovieDepartmentResetFilter onResetFilter;
  final int? movieId;
  final int? selectedPredefinedBudgetDivisionTypeId;
  const MovieBudgetExpenseDepartmentFilterWidget({
    super.key,
    required this.onSubmitFilter,
    required this.onResetFilter,
    required this.companyId,
    required this.movieId,
    required this.selectedPredefinedBudgetDivisionTypeId,
  });

  @override
  State<MovieBudgetExpenseDepartmentFilterWidget> createState() =>
      _MovieBudgetExpenseDepartmentFilterWidgetState();
}

class _MovieBudgetExpenseDepartmentFilterWidgetState
    extends State<MovieBudgetExpenseDepartmentFilterWidget> {
  GetIt getIt = GetIt.instance;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final SelectService _selectService;

  List<Status>? predefineBudgetDivisions = [];
  Status? selectedPredefinedBudgetDivision;

  @override
  initState() {
    super.initState();
    _apiService = getIt<ApiService>();
    _loggerService = getIt<LoggerService>();
    _selectService = getIt<SelectService>();

    predefineBudgetDivisions = _selectService.GetPredefinedBudgetDivisionTypes()
        .where((item) =>
            (item.id == PredefinedBudgetDivisionTypes.preProduction.value) ||
            (item.id == PredefinedBudgetDivisionTypes.production.value) ||
            (item.id == PredefinedBudgetDivisionTypes.postProduction.value) ||
            (item.id == PredefinedBudgetDivisionTypes.others.value))
        .toList();

    if (widget.selectedPredefinedBudgetDivisionTypeId != null) {
      selectedPredefinedBudgetDivision = predefineBudgetDivisions?.firstWhere(
          (item) => item.id == widget.selectedPredefinedBudgetDivisionTypeId);
    }
  }

  applyFilter() {
    widget.onSubmitFilter(
      selectedPredefinedBudgetDivisionTypeId:
          selectedPredefinedBudgetDivision?.id,
    );
    Navigator.pop(context);
  }

  resetFilter() {
    setState(() {
      selectedPredefinedBudgetDivision = null;
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
                SizedBox(
                  height: 20.h,
                ),
                const Text("Stage"),
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
                  value: selectedPredefinedBudgetDivision,
                  hint: const Text("Select Budget Division"),
                  items: predefineBudgetDivisions?.map((item) {
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
                      selectedPredefinedBudgetDivision = newValue;
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
