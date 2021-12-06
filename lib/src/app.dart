import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/views/employees_screen.dart';
import 'package:los_yoyos/src/ui/views/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Los Yoyos',
        theme: ThemeData(fontFamily: 'Ubuntu'),
        initialRoute: '/',
        routes: {
         '/'         : (context) => const HomeScreen(),
         'employees' : (context) => const EmployeesScreen(),
        });
  }
}
