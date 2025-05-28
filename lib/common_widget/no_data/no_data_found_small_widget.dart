import 'package:astro_mobile/constant/assets.dart';
import 'package:flutter/material.dart';

class NoDataFoundSmallWidget extends StatefulWidget {
  const NoDataFoundSmallWidget({super.key});

  @override
  State<NoDataFoundSmallWidget> createState() => _NoDataFoundSmallWidgetState();
}

class _NoDataFoundSmallWidgetState extends State<NoDataFoundSmallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 280,
        width: 200,
        alignment: Alignment.center,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppImageAssets.noDataFoundChartImage)),
            SizedBox(
              height: 10,
            ),
            Text("No expense reports found"),
          ],
        ));
  }
}
