import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:los_yoyos/src/ui/widgets/home/header_widget.dart';
import 'package:los_yoyos/src/ui/widgets/home/login_txt_fields_widget.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Header()),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: cardsColor,
                ),
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      subContainerHeader(),
                      const LoginTextField(),
                    ],
                  ),
                ),
              ),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget subContainerHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35.0, bottom: 20.0),
          child: SvgPicture.asset('assets/workspace.svg', width: 250.0),
        ),
        Text('Welcome!', style: TextStyle(fontSize: 25.0, color: lightRed),),
      ],
    );
  }
}
