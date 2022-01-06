import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo_01/routers/pages.dart';
import 'package:test_demo_01/routers/routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.HOMEPAGE,
      getPages: Pages.pages,
    );
  }
}



