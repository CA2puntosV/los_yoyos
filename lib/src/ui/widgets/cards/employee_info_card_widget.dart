import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:los_yoyos/src/util/cons_text_style.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class EmployeeInfoCard extends StatelessWidget {
  const EmployeeInfoCard({
    required this.name,
    required this.position,
    required this.wage,
    required this.employees,
    required this.companyName,
    required this.id,
    Key? key,
  }) : super(key: key);

  final String name;
  final String position;
  final String wage;
  final List employees;
  final String companyName;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListTile(
          title: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: ptSans,
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(position, style: ptSans),
              Text('Wage: $wage', style: ptSans),
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
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
                      Text(companyName.toUpperCase(), style: bigText),
                      const Divider(color: Colors.white),
                      const SizedBox(height: 15.0),
                      //--------------------------//
                      Center(
                        child: SvgPicture.asset(
                          position == 'CEO'
                              ? 'assets/male_avatar.svg'
                              : 'assets/employee_avatar.svg',
                          width: 80.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(child: Text('ID', style: mediumText)),
                          Expanded(child: Text(id), flex: 2),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(child: Text('NAME', style: mediumText)),
                          Expanded(child: Text(name), flex: 2),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(child: Text('POSITION', style: mediumText)),
                          Expanded(child: Text(position), flex: 2),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(child: Text('WAGE', style: mediumText)),
                          Expanded(child: Text(wage), flex: 2),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      employees.isEmpty
                          ? const SizedBox()
                          : Row(
                              children: [
                                Expanded(
                                    child:
                                        Text('EMPLOYEES', style: mediumText)),
                                Expanded(child: Text('$employees'), flex: 2),
                              ],
                            ),
                      const SizedBox(height: 5.0),
                      const Divider(color: Colors.white),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: position == 'CEO' ? Colors.orange : cardsColor,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      height: 80.0,
    );
  }
}
