import 'package:astro_mobile/framework/common/utils/date_utils.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef DatePickerSelectionCallBack = Function({required DateTime? value});

class AppDatePicker extends StatefulWidget {
  DateTime? dateValue;
  DatePickerSelectionCallBack onSelect;
  AppDatePicker({super.key, required this.dateValue, required this.onSelect});

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.dateValue;
  }

  Future<void> _appDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        widget.onSelect(value: selectedDate);
      });
    } else {
      setState(() {
        selectedDate = null;
        widget.onSelect(value: selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Change border radius
        ),
        backgroundColor: Colors.white,
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
      ),
      onPressed: () => _appDatePicker(),
      child: SizedBox(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: ThemeColor.mainThemeColor,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                selectedDate != null
                    ? CustomDateUtils.getFormattedDate(date: selectedDate)
                    : "Select Date",
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          if (selectedDate != null) ...[
            SizedBox(
              height: 18.h,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      selectedDate = null;
                      widget.onSelect(value: selectedDate);
                    });
                  },
                  icon: Icon(Icons.clear)),
            )
          ],
        ],
      )),
    );
  }
}
