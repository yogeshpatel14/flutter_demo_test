import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_drive/src/components/button/custom_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String strText = "";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
    );
  }
}
