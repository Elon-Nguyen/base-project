import 'package:base_project/presentation/constants/app_text_style.dart';
import 'package:base_project/presentation/widgets/button_widget.dart';
import 'package:base_project/presentation/widgets/dialog/dialog_banner.dart';
import 'package:base_project/presentation/widgets/dialog/dialog_comfirm.dart';
import 'package:base_project/presentation/widgets/header.dart';
import 'package:base_project/presentation/widgets/loading.dart';
import 'package:base_project/presentation/widgets/textfield_widget.dart';
import 'package:base_project/presentation/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(title: widget.title),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:', style: context.textStyle.size18.w400.black),
                  Text('$_counter', style: context.textStyle.size22.w700.red),
                  TextFormFieldWidget(isPasswordField: true),
                  ButtonWidget(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    text: "Button 1",
                    onTap: () {
                      Loading.show(context);
                      Future.delayed(Duration(seconds: 3), () {
                        Loading.hide(context);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          // CustomSnackBar.show(context: context, message: "aaaaaa", type: SnackBarType.info);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
