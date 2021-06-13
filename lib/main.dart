import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/screens/MainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

