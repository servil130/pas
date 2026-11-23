import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pas/component/CustomeTheme.dart';
import 'package:pas/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CustomeTheme.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomeTheme.green,
          brightness: Brightness.dark,
          surface: CustomeTheme.background,
        ).copyWith(
          primary: CustomeTheme.green,
          onPrimary: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomeTheme.background,
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      // ganti ke Routes.login untuk versi final
      initialRoute: Routes.menu_page,
      getPages: Routes.myPages,
    );
  }
}