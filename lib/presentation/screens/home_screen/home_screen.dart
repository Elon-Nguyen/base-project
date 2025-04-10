import 'dart:developer';

import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/gen/assets.gen.dart';
import 'package:base_project/presentation/widgets/button_widget.dart';
import 'package:base_project/presentation/widgets/custom_snack_bar.dart';
import 'package:base_project/presentation/widgets/header.dart';
import 'package:base_project/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.title, super.key});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            title: widget.title,
            iconLeft: Assets.icons.iconX,
            functionLeft: () {
              log('object');
            },
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Pushed', style: context.textStyle.size18.w400.black),
                  Text('$_counter'),
                  TextFormFieldWidget(isPasswordField: true),
                  ButtonWidget(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    text: 'Button 1',
                    onTap: () {
                      // Loading.show(context);
                      // Future.delayed(const Duration(seconds: 3), () {
                      //   Loading.hide(context);
                      // });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CustomSnackBar.show(context: context, message: 'aaaaaa', type: SnackBarType.error),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
