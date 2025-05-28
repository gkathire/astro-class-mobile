import 'package:astro_mobile/api/services/select-service.dart';
import 'package:astro_mobile/common_widget/styles/button_style.dart';
import 'package:astro_mobile/framework/infrastructure/log/logger_service.dart';
import 'package:astro_mobile/framework/model/framework_model.dart';
import 'package:astro_mobile/framework/services/api_service.dart';
import 'package:astro_mobile/models/app-enums.dart';
import 'package:astro_mobile/models/app_custom_model.dart';
import 'package:astro_mobile/theme_data/custom_text_scaler.dart';
import 'package:astro_mobile/theme_data/theme_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

typedef OnTabMovieBudgetMonthlyReportSubmitFilter = void Function({
  int? selectedPredefinedBudgetDivisionTypeId,
  MovieBudgetExpenseMonthlySummaryContainerModel? selectedYearSummaryContainer,
});
typedef OnTabMovieMonthlyResetFilter = void Function();
Future<dynamic> showBudgetExpenseMonthlyFilterWidget({
  required BuildContext context,
  required OnTabMovieBudgetMonthlyReportSubmitFilter onSubmitFilter,
  required OnTabMovieMonthlyResetFilter onResetFilter,
  required int? companyId,
  required int? movieId,
  required int? predefinedBudgetDivisionTypeId,
  required MovieBudgetExpenseMonthlySummaryContainerModel?
      selectedMovieBudgetExpenseContainer,
  required List<MovieBudgetExpenseMonthlySummaryContainerModel>
      movieBudgetExpenseContainerList,
}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          color: ThemeColor.white,
          height: 0.40.sh,
          width: 1.sw,
          child: MovieBudgetExpenseMonthlyFilterWidget(
            movieId: movieId,
            companyId: companyId,
            selectedMovieBudgetExpenseContainer:
                selectedMovieBudgetExpenseContainer,
            selectedPredefinedBudgetDivisionTypeId:
                predefinedBudgetDivisionTypeId,
            movieBudgetExpenseContainerList: movieBudgetExpenseContainerList,
            onSubmitFilter: (
                {selectedPredefinedBudgetDivisionTypeId,
                selectedYearSummaryContainer}) {
              onSubmitFilter(
                selectedPredefinedBudgetDivisionTypeId:
                    selectedPredefinedBudgetDivisionTypeId,
                selectedYearSummaryContainer: selectedYearSummaryContainer,
              );
            },
            onResetFilter: () {
              onResetFilter();
            },
          ),
        );
      });
}

class MovieBudgetExpenseMonthlyFilterWidget extends StatefulWidget {
  final OnTabMovieBudgetMonthlyReportSubmitFilter onSubmitFilter;
  final int? companyId;
  final OnTabMovieMonthlyResetFilter onResetFilter;
  final int? movieId;
  final int? selectedPredefinedBudgetDivisionTypeId;
  final MovieBudgetExpenseMonthlySummaryContainerModel?
      selectedMovieBudgetExpenseContainer;
  final List<MovieBudgetExpenseMonthlySummaryContainerModel>
      movieBudgetExpenseContainerList;

  const MovieBudgetExpenseMonthlyFilterWidget({
    super.key,
    required this.onSubmitFilter,
    required this.onResetFilter,
    required this.companyId,
    required this.movieId,
    required this.movieBudgetExpenseContainerList,
    required this.selectedPredefinedBudgetDivisionTypeId,
    required this.selectedMovieBudgetExpenseContainer,
  });

  @override
  State<MovieBudgetExpenseMonthlyFilterWidget> createState() =>
      _MovieBudgetExpenseMonthlyFilterWidgetState();
}

class _MovieBudgetExpenseMonthlyFilterWidgetState
    extends State<MovieBudgetExpenseMonthlyFilterWidget> {
  GetIt getIt = GetIt.instance;
  late final ApiService _apiService;
  late final LoggerService _loggerService;
  late final SelectService _selectService;

  List<Status>? predefineBudgetDivisions = [];
  Status? selectedPredefinedBudgetDivision;
  MovieBudgetExpenseMonthlySummaryContainerModel? selectedYearSummaryContainer;
  List<MovieBudgetExpenseMonthlySummaryContainerModel>
      movieBudgetExpenseContainerList = [];

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

    movieBudgetExpenseContainerList = widget.movieBudgetExpenseContainerList;

    if (widget.selectedPredefinedBudgetDivisionTypeId != null) {
      selectedPredefinedBudgetDivision = predefineBudgetDivisions?.firstWhere(
          (item) => item.id == widget.selectedPredefinedBudgetDivisionTypeId);
    }

    if (widget.selectedMovieBudgetExpenseContainer != null) {
      selectedYearSummaryContainer = movieBudgetExpenseContainerList.firstWhere(
          (item) =>
              item.year == widget.selectedMovieBudgetExpenseContainer?.year);
    }
  }

  applyFilter() {
    widget.onSubmitFilter(
      selectedPredefinedBudgetDivisionTypeId:
          selectedPredefinedBudgetDivision?.id,
      selectedYearSummaryContainer: selectedYearSummaryContainer,
    );
    Navigator.pop(context);
  }

  resetFilter() {
    setState(() {
      selectedPredefinedBudgetDivision = null;
      selectedYearSummaryContainer = null;
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
                Text("Year"),
                SizedBox(height: 10.h),
                DropdownButtonFormField2<
                    MovieBudgetExpenseMonthlySummaryContainerModel>(
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
                  value: selectedYearSummaryContainer,
                  hint: const Text("Select Year"),
                  items: movieBudgetExpenseContainerList.map((item) {
                    return DropdownMenuItem<
                        MovieBudgetExpenseMonthlySummaryContainerModel>(
                      value: item,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        item.yearText ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (MovieBudgetExpenseMonthlySummaryContainerModel?
                      newValue) {
                    setState(() {
                      selectedYearSummaryContainer = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text("Stage"),
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
