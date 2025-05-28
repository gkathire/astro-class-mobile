import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef DropdownValueSelection = Function(dynamic value);

class AppDropdownWidget<T> extends StatelessWidget {
  final DropdownValueSelection valueSelection;
  final List<T> items;
  final String placeholder;
  final T value;
  final String bindLabel;
  const AppDropdownWidget({
    super.key,
    required this.valueSelection,
    required this.items,
    required this.value,
    required this.bindLabel,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
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
      value: value,
      hint: Text(bindLabel),
      items: items?.map((item) {
        final mapItem = item as Map<String, dynamic>?;
        return DropdownMenuItem<T>(
          value: item,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            mapItem?[bindLabel],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
      onChanged: (T? newValue) {
        valueSelection(newValue);
      },
    );
  }
}
