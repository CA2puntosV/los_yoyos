import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/widgets/cards/company_data_card_widget.dart';
import 'package:los_yoyos/src/ui/widgets/form_field_widget.dart';
import 'package:los_yoyos/src/ui/widgets/drawer_widget.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class AddNewEmployees extends StatefulWidget {
  const AddNewEmployees({
    Key? key,
    required this.companyName,
    required this.address,
  }) : super(key: key);

  final String companyName;
  final String address;

  @override
  State<AddNewEmployees> createState() => _AddNewEmployeesState();
}

class _AddNewEmployeesState extends State<AddNewEmployees> {
  final bool _showMessage = false; // TODO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              bottom: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                const Text(
                  'Add New Employee',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(height: 15.0),
                CompanyDataCard(
                  companyName: widget.companyName,
                  address: widget.address,
                ),
                const SizedBox(height: 15.0),
                const FormFieldWidget(),
                // Image.asset('assets/new_employees.png', width: 300),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
