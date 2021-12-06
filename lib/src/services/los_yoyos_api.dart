import 'dart:convert';

import 'package:http/http.dart' as http;
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

  Future postEmployees() async {
    try {
      var rps = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "employees": [
              {
                "employees": [
                  {
                    "id": "60",
                    "name": "Manolo",
                    "position": "iOS Dev",
                    "wage": "50",
                  }
                ]
              }
            ]
          },
        ),
      );
      print(rps.statusCode);
    } on Error catch (e) {
      print('Error $e');
    }
  }
}
