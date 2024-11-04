import 'package:apps/bindings/general_bindings.dart';
import 'package:apps/data/services/authentication_service.dart';
import 'package:apps/features/authentication/screens/login/login.dart';
import 'package:apps/features/home/home.dart';
//import 'package:apps/features/authentication/screens/onboarding/onboarding.dart';
//import 'package:apps/utils/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:apps/utils/theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      //darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      home: FutureBuilder<Widget>(
        future: _determineStartScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data ?? const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Future<Widget> _determineStartScreen() async {
    //final localStorage = LocalStorage();
    final authService = AuthenticationService();

    /*
    bool isFirstTime = localStorage.readData<bool>('isFirstTime') ?? true;

    if (isFirstTime) {
      await localStorage.saveData('isFirstTime', false);
      FlutterNativeSplash.remove();
      return const OnBoardingScreen();
    }
    */

    Future<bool> isLoggedIn = authService.isLoggedIn();
    FlutterNativeSplash.remove();
    if (await isLoggedIn) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
