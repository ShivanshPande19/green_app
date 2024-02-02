import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:device_preview/device_preview.dart';
import 'dashboard.dart';
import 'splashing.dart';
const users = {
  'dribbble@gmail.com': '12345',
  'huter@gmail.com': 'hunter',
};
final List<int> _items = List<int>.generate(5, (int index) => index);
void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

List<String> pages = <String>['Log-In', 'Sign-Up'];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  Duration get loginTime => const Duration(milliseconds: 2250);
  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logoTag: 'boxing_the_tag',

      logo: const AssetImage('images/logo_app_fi.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        ));
      },
      // todo adding the password hints here
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        // login screen &button color
        primaryColor: Colors.green.shade400,
        // loading icon,-- contrast with primary
        accentColor: Colors.green,
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.greenAccent,
          letterSpacing: 4
        ),

        bodyStyle: const TextStyle(
          decoration: TextDecoration.underline
        ),
        textFieldStyle: const TextStyle(
          color: Colors.yellow,
          shadows: [Shadow(color: Colors.yellow,blurRadius: 2)]
        ),
        cardTheme: const CardTheme(
          color: Colors.white
          )
        ),




    );
  }
}

