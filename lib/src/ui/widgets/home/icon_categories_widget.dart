import 'package:flutter/material.dart';

import 'package:los_yoyos/src/util/const_text_style.dart';

class IconCategories extends StatelessWidget {
  const IconCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconCategories(
              context: context,
              icon: Icons.business,
              title: 'About Us',
              onPressed: () => Navigator.pushNamed(
                context,
                'aboutUs',
              ),
            ),
            iconCategories(
              context: context,
              icon: Icons.groups,
              title: 'Staff Team',
              onPressed: () => Navigator.pushNamed(
                context,
                'staffList',
              ),
            ),
          ],
        ),
        const SizedBox( height: 15.0 ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            iconCategories(
              context: context,
              icon: Icons.person_add,
              title: 'Add Employee',
              onPressed: () => Navigator.pushNamed(
                context,
                'addEmployee',
              ),
            ),
            iconCategories(
              context: context,
              icon: Icons.child_care,
              title: 'New Employees',
              onPressed: () => Navigator.pushNamed(
                context,
                'newEmp',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget iconCategories({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.orange,
        boxShadow: [
           BoxShadow(
            color: Colors.orange.withOpacity(0.5),
            offset: const Offset(4, 5),
          ),
        ],
      ),
      width: 150.0,
      height: 75.0,
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              title,
              style: mediumText,
            ),
          ],
        ),
        onPressed: onPressed,
        //
      ),
    );
  }
}
