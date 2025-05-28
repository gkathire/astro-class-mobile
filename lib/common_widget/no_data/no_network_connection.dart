import 'package:astro_mobile/constant/assets.dart';
import 'package:astro_mobile/themedata/themecolor.dart';
import 'package:flutter/material.dart';

class NoNetworkConnectionFound extends StatefulWidget {
  const NoNetworkConnectionFound({super.key});

  @override
  State<NoNetworkConnectionFound> createState() =>
      _NoNetworkConnectionFoundState();
}

class _NoNetworkConnectionFoundState extends State<NoNetworkConnectionFound> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ThemeColor.white,
        padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppImageAssets.noNetwrokConnectionImage)),
            SizedBox(
              height: 20,
            ),
            Text(textAlign: TextAlign.center, "Network Connection Error")
          ],
        ));
  }
}
