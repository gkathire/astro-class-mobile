import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  final bool canShowMessage;
  final String? customMessage;
  final String? customSubMessage;
  const NoDataFoundWidget(
      {super.key,
      required this.canShowMessage,
      this.customMessage,
      this.customSubMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(AppImageAssets.noDataFoundImage),
            height: 250,
          ),
          showMessageContainer(
              canShowMessage: canShowMessage, customMessage: customMessage),
        ],
      )),
    );
  }

  Widget showMessageContainer(
      {required bool canShowMessage, required String? customMessage}) {
    if (canShowMessage) {
      if (customMessage == null) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "No data found",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaler: TextScaler.linear(1.3),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 320,
              child: Text(
                "Try adjusting your search or filter to find what you're looking for.",
                textAlign: TextAlign.center,
                style: TextStyle(color: ThemeColor.darkGrey),
              ),
            )
          ],
        );
      } else {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              customMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textScaler: const TextScaler.linear(1.3),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 320,
              child: Text(
                customSubMessage ??
                    "Try Refreshing the App or Contact Administration If You Think This Is A Mistake",
                textAlign: TextAlign.center,
                style: TextStyle(color: ThemeColor.darkGrey),
              ),
            )
          ],
        );
      }
    } else {
      return const SizedBox(
        height: 10,
      );
    }
  }
}
