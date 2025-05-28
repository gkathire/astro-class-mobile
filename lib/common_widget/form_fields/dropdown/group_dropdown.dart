
  import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> buildGroupedDropdownItems(Map<String, List<String>> groupedItems) {
    List<DropdownMenuItem<String>> dropdownItems = [];

    groupedItems.forEach((groupName, items) {
      // Add the group header
      dropdownItems.add(
        DropdownMenuItem<String>(
          enabled: false, // Disable header selection
          child: Text(
            groupName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      );

      // Add each item in the group
      items.forEach((item) {
        dropdownItems.add(
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(item),
            ),
          ),
        );
      });
    });

    return dropdownItems;
  }
