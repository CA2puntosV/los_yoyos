import 'package:flutter/material.dart';
import 'package:los_yoyos/src/util/cons_text_style.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class Header extends StatelessWidget {
   Header({Key? key}) : super(key: key);

  final _txtStye = TextStyle(
    fontSize: 25.0,
    color: lightRed,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            'Los Yoyos',
            style: bigText,
          ),
          const Expanded(child: SizedBox()),
          Text(
            'Login',
            style: _txtStye,
          ),
        ],
      ),
    );
  }
}
