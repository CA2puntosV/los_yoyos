import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:los_yoyos/src/ui/widgets/cards/company_data_card_widget.dart';
import 'package:los_yoyos/src/models/employees_models.dart';
import 'package:los_yoyos/src/services/los_yoyos_api.dart';
import 'package:los_yoyos/src/ui/widgets/drawer_widget.dart';
import 'package:los_yoyos/src/util/const_text_style.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class NewEmployees extends StatefulWidget {
  const NewEmployees({Key? key}) : super(key: key);

  @override
  State<NewEmployees> createState() => _NewEmployeesState();
}

class _NewEmployeesState extends State<NewEmployees> {
  final LosYoyosApi _losYoyosApi = LosYoyosApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<List<NewEmployeeRegister>>(
        future: _losYoyosApi.getNewUser(),
        builder: (context, snapshot) {
          List<NewEmployeeRegister>? newUser = snapshot.data ?? [];
          var _hasData = snapshot.data ?? [];
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  header(),
                  const SizedBox(height: 15.0),
                  const CompanyDataCard(
                    companyName: 'Los Yoyos',
                    address: 'Carrera 123 # 45 - 67. 95\nOficina: 89',
                  ),
                  const SizedBox(height: 15.0),
                  _hasData.isEmpty
                      ? Expanded(
                          child: notFound(),
                        )
                      : Expanded(
                          child: GridView.count(
                            crossAxisSpacing: 15,
                            crossAxisCount: 2,
                            children: [
                              for (NewEmployeeRegister user in newUser)
                                newUserData(
                                  fullName: user.fullName,
                                  id: user.userId,
                                  email: user.email,
                                  position: user.position,
                                  wage: user.wage,
                                ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        const Text(
          'New Employees',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {});
            }),
      ],
    );
  }

  Widget notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(
            'assets/not_found.png',
          ),
        ),
        Text(
          'Not data available yet D:',
          style: bigText(null),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Try adding new users',
          style: mediumText,
        ),
      ],
    );
  }

  Widget newUserData({
    required String fullName,
    required String id,
    required String email,
    required String position,
    required String wage,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: cardsColor,
          ),
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  fullName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: bigText(Colors.black),
                ),
                subtitle: Column(
                  children: [
                    const SizedBox(height: 5.0),
                    Text('ID: $id'),
                    Text(
                      position,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                onTap: () {
                  print('kappa');
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                          ),
                          color: subContainer,
                        ),
                        padding: const EdgeInsets.all(32.0),
                        height: 400.0,
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('LOS YOYOS', style: bigText(null)),
                            const Divider(color: Colors.white),
                            const SizedBox(height: 15.0),
                            //--------------------------//
                            Center(
                              child: SvgPicture.asset(
                                'assets/employee_avatar.svg',
                                width: 80.0,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              children: [
                                Expanded(
                                  child:
                                      Text('ID', style: bigText(Colors.orange)),
                                ),
                                Expanded(
                                  child: Text(id, style: mediumText),
                                  flex: 2,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('NAME',
                                      style: bigText(Colors.orange)),
                                ),
                                Expanded(
                                  child: Text(fullName, style: mediumText),
                                  flex: 2,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('EMAIL',
                                      style: bigText(Colors.orange)),
                                ),
                                Expanded(
                                  child: Text(email, style: mediumText),
                                  flex: 2,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('POSITION',
                                      style: bigText(Colors.orange)),
                                ),
                                Expanded(
                                    child: Text(position, style: mediumText),
                                    flex: 2),
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('WAGE',
                                      style: bigText(Colors.orange)),
                                ),
                                Expanded(
                                  child: Text(wage, style: mediumText),
                                  flex: 2,
                                ),
                              ],
                            ),

                            const Divider(color: Colors.white),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
