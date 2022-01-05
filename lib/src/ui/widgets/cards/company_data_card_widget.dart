import 'package:flutter/material.dart';
import 'package:los_yoyos/src/util/const_text_style.dart';

import 'package:los_yoyos/src/util/const_colors.dart';

class CompanyDataCard extends StatelessWidget {
  const CompanyDataCard({
    required this.companyName,
    this.address,
    Key? key,
  }) : super(key: key);

  final String? address;
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        print('ci');
      },
      child: Container(
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Image(
                  image: AssetImage('assets/logo_ly.png'),
                  height: 280.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(companyName.toUpperCase(), style: bigText(null)),
                  const SizedBox(height: 5.0),
                  Text(address ?? '', style: smallText),
                ],
              ),
              flex: 2,
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: lightRed,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 100.0,
        width: double.infinity,
      ),
    );
  }
}
