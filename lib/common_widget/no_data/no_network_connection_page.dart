import 'package:flutter_app/common_widget/no_data/no_network_connection.dart';
import 'package:flutter/material.dart';

class NoDataFoundPage extends StatefulWidget {
  const NoDataFoundPage({super.key});

  @override
  State<StatefulWidget> createState() => _NoDataFoundPageState();
}

class _NoDataFoundPageState extends State<NoDataFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: NoNetworkConnectionFound());
  }
}
