import 'package:flutter/material.dart';
import 'package:los_yoyos/src/services/los_yoyos_api.dart';

import 'dart:math';

import 'package:los_yoyos/src/util/const_colors.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({Key? key}) : super(key: key);

  @override
  _FormFieldWidgetState createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  int? _idValue;
  Random randomID = Random();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _wageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          textFields(),
          const SizedBox(height: 15.0),
          Row(
            children: [
              idField(),
              const SizedBox(width: 8.0),
              ElevatedButton(
                child: const Text(
                  'Generate\nID',
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onSurface: Colors.blueGrey[600],
                ),
                onPressed: _idValue == null
                    ? () {
                        setState(() => _idValue = randomID.nextInt(10000));
                      }
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          registerButton(),
        ],
      ),
    );
  }

  Widget textFields() {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          decoration: fieldDecoration(
            labelText: 'Full Name',
            icon: Icons.person,
          ),
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(
            color: Colors.white,
          ),
          validator: (String? val) {
            if (val!.isEmpty) {
              return 'Required field';
            }
          },
        ),
        const SizedBox(height: 15.0),
        TextFormField(
          controller: _emailController,
          decoration: fieldDecoration(
            labelText: 'Email',
            icon: Icons.email,
          ),
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.white,
          ),
          validator: (String? val) {
            if (val!.isEmpty) {
              return 'Required field';
            }
          },
        ),
        const SizedBox(height: 15.0),
        TextFormField(
          controller: _positionController,
          decoration: fieldDecoration(
            labelText: 'Position',
            icon: Icons.work,
          ),
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(
            color: Colors.white,
          ),
          validator: (String? val) {
            if (val!.isEmpty) {
              return 'Required field';
            }
          },
        ),
        const SizedBox(height: 15.0),
        TextFormField(
          controller: _wageController,
          decoration: fieldDecoration(
            labelText: 'Wage',
            icon: Icons.paid,
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
          keyboardType: TextInputType.number,
          validator: (String? val) {
            if (val!.isEmpty) {
              return 'Required field';
            }
          },
        ),
      ],
    );
  }

  Widget idField() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1.0,
              color: Colors.orange,
            ),
            left: BorderSide(
              width: 1.0,
              color: Colors.orange,
            ),
            bottom: BorderSide(
              width: 1.0,
              color: Colors.orange,
            ),
            right: BorderSide(
              width: 1.0,
              color: Colors.orange,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.contact_mail,
                color: lightRed,
              ),
              const SizedBox(width: 12.0),
              Text(
                _idValue?.toString() ?? 'ID',
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'PTSans',
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
          child: const Text(
            'Register',
            style: TextStyle(
              fontFamily: 'PTSans',
              fontSize: 18.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            onSurface: Colors.blueGrey[600],
          ),
          onPressed: _nameController.text.isEmpty &&
                      _emailController.text.isEmpty &&
                      _positionController.text.isEmpty &&
                      _wageController.text.isEmpty ||
                  _idValue == null
              ? null //TODO fix validations
              : () async {
                  if (_globalKey.currentState!.validate()) {
                    bool rps = await LosYoyosApi().saveNewUser(
                      fullName: _nameController.text,
                      email: _emailController.text,
                      position: _positionController.text,
                      wage: _wageController.text,
                      userId: _idValue.toString(),
                    );
                    if (rps) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              const Text('New User Successfully Registered'),
                          backgroundColor: lightRed,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Something went wrong'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    Navigator.pop(context);
                  }
                }),
    );
  }

  InputDecoration fieldDecoration({
    required String labelText,
    required IconData icon,
  }) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightRed),
      ),
      prefixIcon: Icon(
        icon,
        color: lightRed,
      ),
      labelText: labelText,
      labelStyle: const TextStyle(
        fontFamily: 'PTSans',
        color: Colors.grey,
      ),
    );
  }
}
