import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:los_yoyos/src/services/los_yoyos_api.dart';
import 'package:los_yoyos/src/util/cons_text_style.dart';

class AddEmployee extends StatelessWidget {
  AddEmployee({required this.companyName, Key? key}) : super(key: key);

  final LosYoyosApi _yoyosApi = LosYoyosApi();

  final String companyName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _yoyosApi.postEmployees(),
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Row(
                children: [
                  Text('Add employee', style: mediumText),
                  const SizedBox(width: 8.0),
                  const Icon(Icons.add, color: Colors.white),
                ],
              ),
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return SlideInDown(
                      child: AlertDialog(
                        title: Column(
                          children: [
                            Text(companyName.toUpperCase()),
                            const Text('Add New Employeer'),
                            const Divider(color: Colors.black),
                          ],
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            TextField(
                              decoration: InputDecoration(hintText: 'Full Name'),
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'Position'),
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'Wage'),
                            ),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _yoyosApi.postEmployees();
                                },
                                child: const Text('Register'),
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
