import 'package:base_project/di/service_locator.dart';
import 'package:base_project/presentation/controllers/login_controller.dart';
import 'package:base_project/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MockLoginController extends GetxController implements LoginController {
  @override
  final userNameEditController = TextEditingController();

  @override
  final passwordEditController = TextEditingController();

  @override
  final erroText = ''.obs;

  @override
  void onClickLogin() {}

  @override
  set erroText(RxString erroText) {}

  @override
  String validateLogin() {
    throw UnimplementedError();
  }
}

void main() {
  late MockLoginController mockController;

  setUp(() {
    mockController = MockLoginController();

    locator.reset();
    initApp();

    locator
      ..unregister<LoginController>()
      ..registerSingleton<LoginController>(mockController);
  });

  group('LoginScreen Widget Tests', () {
    testWidgets('Should show input fields', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Should input able', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

      await tester.enterText(find.byType(TextFormField).at(0), 'admin');
      await tester.enterText(find.byType(TextFormField).at(1), '123456');

      expect(mockController.userNameEditController.text, 'admin');
      expect(mockController.passwordEditController.text, '123456');
    });

    testWidgets('Should button pressed', (tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

      final buttonFinder = find.text('Login');
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
    });
  });
}
