import 'package:flutter/material.dart';

import 'package:los_yoyos/src/models/employees_models.dart';
import 'package:los_yoyos/src/services/los_yoyos_api.dart';
import 'package:los_yoyos/src/ui/widgets/cards/company_data_card_widget.dart';
import 'package:los_yoyos/src/ui/widgets/filters/filters_widget.dart';
import 'package:los_yoyos/src/ui/widgets/search/search_bar_widget.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  _EmployeesScreenState createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  final LosYoyosApi _yoyosApi = LosYoyosApi();

  bool isLoading = false;

  late Future<List<Employee>> _employeesList;

  @override
  void initState() {
    super.initState();

    _employeesList = _yoyosApi.getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<Employee>>(
        future: _employeesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        color: cardsColor,
                      ),
                      child: const SearchBar(),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: _employeesListWidget(snapshot.data!),
                    ),
                    flex: 7,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const SizedBox();
        },
      ),
    );
  }

  List<Widget> _employeesListWidget(List<Employee> data) {
    List<Widget> employeesListView = [];

    if (data.isNotEmpty) {
      var getCompanyName = data[0].companyName;
      var getAddress = data[0].address;

      employeesListView.add(
        Column(
          children: [
            CompanyDataCard(
              companyName: getCompanyName,
              address: getAddress,
            ),
          ],
        ),
      );
    }

    employeesListView.add(
      const Filters(),
    );

    return employeesListView;
  }
}
