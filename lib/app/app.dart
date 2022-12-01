import 'package:flutter/material.dart';
import '../core/utils/routes_manager.dart';
import '../core/utils/theme_manager.dart';

class MyApp extends StatefulWidget {
  // const MyApp({super.key}); // default constructor

  //--------- return one instance in all my application ----------

   const MyApp._internal(); // name constructor
  static const MyApp _instance = MyApp._internal();  // Singleton or single instance
  factory MyApp() => _instance;  // factory 

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
