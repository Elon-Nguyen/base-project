import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading {
  const Loading._();
  static void show() {
    Get.dialog(
      WillPopScope(onWillPop: () => Future.value(false), child: showLoading()),
    );
  }

  static void hide() {
    Get.back();
  }

  static Container showLoading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: const SizedBox(
        height: 150,
        width: 150,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
