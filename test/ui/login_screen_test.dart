import 'package:base_project/core/di/service_locator.dart';
import 'package:base_project/domain/usercases/login_with_email_password.dart';
import 'package:base_project/domain/usercases/save_tokens.dart';
import 'package:base_project/presentation/screens/login_screen/login_controller.dart';
import 'package:base_project/presentation/screens/login_screen/login_screen.dart';
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
  Future<void> onClickLogin() async {}

  @override
  set erroText(RxString erroText) {}

  @override
  String validateLogin() {
    throw UnimplementedError();
  }

  @override
  LoginWithEmailPassword get loginWithEmailPassword =>
      throw UnimplementedError();

  @override
  SaveTokens get saveTokens => throw UnimplementedError();
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
    testWidgets('LoginScreen Widget should contain interface elements', (
      tester,
    ) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

      expect(find.text('Sign In'), findsOneWidget);
      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets(
      'LoginScreen Widget should have email field and password field',
      (tester) async {
        await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

        await tester.enterText(find.byType(TextFormField).at(0), 'admin');
        await tester.enterText(find.byType(TextFormField).at(1), '123456');

        expect(mockController.userNameEditController.text, 'admin');
        expect(mockController.passwordEditController.text, '123456');
      },
    );

    testWidgets("LoginScreen Widget's login button should be clickable", (
      tester,
    ) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

      final buttonFinder = find.text('Sign In');
      expect(buttonFinder, findsOneWidget);

      await tester.tap(buttonFinder);
    });
  });
}
