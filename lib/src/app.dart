import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:los_yoyos/src/ui/views/about_us_screen.dart';
import 'package:los_yoyos/src/ui/views/add_employees_screen.dart';
import 'package:los_yoyos/src/ui/views/employees_screen.dart';
import 'package:los_yoyos/src/ui/views/home_screen.dart';
import 'package:los_yoyos/src/ui/views/new_employees_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const CircularProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Los Yoyos',
            theme: ThemeData(fontFamily: 'Ubuntu'),
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              'staffList': (context) => const EmployeesScreen(),
              'addEmployee': (context) => const AddNewEmployees(
                    companyName: 'Los Yoyos',
                    address: 'Carrera 123 # 45 - 67. 95\nOficina: 89',
                  ),
              'aboutUs': (context) => const AboutUs(),
              'newEmp': (context) => const NewEmployees(),
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
