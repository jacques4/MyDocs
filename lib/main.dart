import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mydocs/app/UI/views/auth/signIn.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Docs',
      debugShowCheckedModeBanner: false,
      home: const SignIn(),
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          hintColor: Colors.grey,
          colorScheme: ColorScheme.light(
            primary: Colors.blue,
            secondary: Colors.black,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black), // change the color here
          ),
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.dark(
            primary: Colors.black,
            secondary: Colors.white,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.white), // change the color here
          ),
        ),
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'My Docs',
              theme: theme,
              themeMode: ThemeMode.system,
              darkTheme: darkTheme,
              home: const SignIn(),
            ));
  }*/
}
