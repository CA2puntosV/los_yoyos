import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_database/firebase_database.dart';
import 'package:los_yoyos/src/models/employees_models.dart';

class LosYoyosApi {
  String url =
      'https://raw.githubusercontent.com/sapardo10/content/master/RH.json';

  Future<List<Employee>> getEmployees({String? query}) async {
    final rps = await http.get(
      Uri.parse(url),
    );

    List<Employee> employees = [];

    if (rps.statusCode == 200) {
      String body = utf8.decode(rps.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var item in jsonData['employees']) {
        employees.add(
          Employee(
            address: jsonData['address'],
            companyName: jsonData['company_name'],
            employees: item['employees'],
            id: item['id'],
            name: item['name'],
            position: item['position'],
            wage: item['wage'],
          ),
        );
      }

      return employees;
    } else {
      throw Exception('Connection Failed');
    }
  }

  Future<bool> saveNewUser({
    required String fullName,
    required String email,
    required String position,
    required String wage,
    required String userId,
  }) async {
    try {
      await FirebaseDatabase.instance.ref().child('newUser').push().set(
        {
          'fullName': fullName,
          'email': email,
          'position': position,
          'wage': wage,
          'userId': userId,
        },
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<NewEmployeeRegister>> getNewUser() async {
    List<NewEmployeeRegister> newUser = [];

    try {
      DataSnapshot snap =
          await FirebaseDatabase.instance.ref().child('newUser').get();

      dynamic snapVal = snap.value;

      if (snap.exists) {
        snapVal.forEach((key, value) {
          Map mapa = {'key': key, ...value}; // {'key': key, ...value}
          NewEmployeeRegister newEmployee = NewEmployeeRegister(
            fullName: mapa['fullName'],
            email: mapa['email'],
            position: mapa['position'],
            wage: mapa['wage'],
            userId: mapa['userId'],
          );
          newUser.add(newEmployee);
        });
      }

      return newUser;
    } catch (e) {
      print(e);
      return newUser;
    }
  }
}
