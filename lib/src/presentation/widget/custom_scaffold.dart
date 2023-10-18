import 'package:flutter/material.dart';
import '../../core/util/colors.dart';
import 'app_bar.dart';
import 'drawer.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appNameFontColor,
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: body,
    );
  }
}
