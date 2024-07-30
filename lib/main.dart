import 'package:art/bindings/home_binding.dart';
import 'package:art/views/for_you_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: const ForYouView(),
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
