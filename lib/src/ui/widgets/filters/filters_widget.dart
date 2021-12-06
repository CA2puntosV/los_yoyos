import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:los_yoyos/src/ui/widgets/cards/new_employees_card_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:los_yoyos/src/models/employees_models.dart';
import 'package:los_yoyos/src/services/los_yoyos_api.dart';
import 'package:los_yoyos/src/ui/widgets/add_employee_widget.dart';
import 'package:los_yoyos/src/ui/widgets/filters/default_view_widget.dart';
import 'package:los_yoyos/src/util/cons_text_style.dart';
import 'package:animate_do/animate_do.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final LosYoyosApi _yoyosApi = LosYoyosApi();

  bool checkbox1 = false;
  bool checkbox2 = false;
  bool changeTxt = false;
  bool _showFilter = false;

  Container verticalDivider = Container(
    color: Colors.orange,
    height: 40,
    width: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checkBoxes(),
        ],
      ),
    );
  }

  Widget checkBoxes() {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder<List<Employee>>(
      future: _yoyosApi.getEmployees(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Employee>? data = snapshot.data;
          String companyName = data![0].companyName;

          if (checkbox1 == true) {
            data.sort(
              (employeeA, employeeB) =>
                  employeeB.wage.compareTo(employeeA.wage),
            );
          } else if (checkbox2 == true) {
            data.sort(
              (employeeA, employeeB) =>
                  employeeA.wage.compareTo(employeeB.wage),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Filters', style: mediumText),
                          const SizedBox(width: 8.0),
                          const Icon(
                            Icons.filter_list_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          _showFilter = !_showFilter;
                        });
                        print(_showFilter);
                      },
                    ),
                  ),
                  verticalDivider,
                  Expanded(
                    child: AddEmployee(companyName: companyName),
                  ),
                ],
              ),
              _showFilter == true
                  ? FadeInLeft(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.orange,
                          ),
                          width: 150.0,
                          child: Column(
                            children: [
                              box1(),
                              box2(),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              staffingTitle(),
              if (!changeTxt)
                for (var item in data)
                  DefaultView(
                    name: item.name,
                    position: item.position,
                    wage: item.wage.toString(),
                    employees: item.employees,
                    id: item.id.toString(),
                    companyName: item.companyName,
                  )
              else
                Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return const NewEmployees(
                      id: 'ID: New ID',
                      name: 'Name: New Employee',
                      position: 'Position: Free position',
                      wage: 'wage: 320',
                    );
                  },
                  itemCount: data.length,
                  itemWidth: _screenSize.width * 0.8,
                  itemHeight: _screenSize.height * 0.5,
                  layout: SwiperLayout.STACK,
                )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget box1() {
    return Row(
      children: [
        Checkbox(
          value: checkbox1,
          onChanged: (val) async {
            setState(() {
              checkbox2 == false ? checkbox1 = val! : checkbox1 = false;

              if (checkbox1 == true && checkbox2 == false) {
                motionToast(
                  icon: Icons.arrow_upward,
                  title: 'Filter Applied',
                  description: 'Filtered by higher salary',
                );
              }
            });
          },
        ),
        Text('Wage', style: mediumText),
        const Icon(Icons.arrow_upward, color: Colors.white),
      ],
    );
  }

  Widget box2() {
    return Row(
      children: [
        Checkbox(
          value: checkbox2,
          onChanged: (val) {
            setState(() {
              checkbox1 == false ? checkbox2 = val! : checkbox2 = false;

              if (checkbox2 == true && checkbox1 == false) {
                motionToast(
                  icon: Icons.arrow_downward,
                  title: 'Filter Applied',
                  description: 'Filtered by lower salary',
                );
              }
            });
          },
        ),
        Text('Wage', style: mediumText),
        const Icon(Icons.arrow_downward, color: Colors.white),
      ],
    );
  }

  Widget staffingTitle() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Icon(
            Icons.groups,
            color: Colors.white,
            size: 25.0,
          ),
          const SizedBox(width: 10.0),
          Text(
            !changeTxt ? 'Work Staff' : 'New Employees',
            style: bigText,
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            icon: Icon(
              !changeTxt ? Icons.arrow_forward_rounded : Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                changeTxt = !changeTxt;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget newEmployees() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Icon(
            Icons.groups,
            color: Colors.white,
            size: 25.0,
          ),
          Text(
            ' New Employees List ',
            style: bigText,
          ),
        ],
      ),
    );
  }

  Widget? motionToast({
    required IconData icon,
    required String title,
    required String description,
  }) {
    MotionToast(
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(seconds: 2),
      borderRadius: 0,
      description: description,
      icon: icon,
      primaryColor: Colors.orange,
      title: title,
    ).show(context);
  }
}
