import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/widgets/cards/employee_info_card_widget.dart';
import 'package:los_yoyos/src/ui/widgets/cards/mini_cards_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultView extends StatelessWidget {
  const DefaultView({
    required this.name,
    required this.position,
    required this.wage,
    required this.employees,
    required this.id,
    required this.companyName,
    Key? key,
  }) : super(key: key);

  final String name;
  final String position;
  final String wage;
  final List employees;
  final String id;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    position == 'CEO'
                        ? 'assets/male_avatar.svg'
                        : 'assets/employee_avatar.svg',
                    width: 80.0,
                  ),
                ),
                Expanded(
                  child: EmployeeInfoCard(
                    name: name,
                    position: position,
                    wage: wage,
                    employees: employees,
                    companyName: companyName,
                    id: id,
                  ),
                  flex: 3,
                ),
              ],
            ),
            Positioned(
              child: MiniCard(
                id: id.toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
