import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewEmployees extends StatelessWidget {
  const NewEmployees({
    required this.name,
    required this.id,
    required this.position,
    required this.wage,
    Key? key,
  }) : super(key: key);

  final String name;
  final String id;
  final String position;
  final String wage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0),
            SvgPicture.asset('assets/newEmp.svg', width: 250),
            const SizedBox(height: 25.0),
            Text(id),
            const SizedBox(height: 8.0),
            Text(name),
            const SizedBox(height: 8.0),
            Text(position),
            const SizedBox(height: 8.0),
            Text(wage),
          ],
        ),
      ),
    );
  }
}
