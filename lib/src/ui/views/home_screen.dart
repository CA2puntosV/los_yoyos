import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/widgets/home/icon_categories_widget.dart';
import 'package:los_yoyos/src/ui/widgets/drawer_widget.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              backgroundColor,
              lightRed,
            ],
            stops: const [
              0.7,
              0.5,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: IconButton(
                  //     icon: const Icon(
                  //       Icons.menu,
                  //       color: Colors.white,
                  //     ),
                  //     onPressed: () {
                  //     },
                  //   ),
                  // ),
                  const Expanded(child: SizedBox()),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Los Yoyos\nResources',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Image(
                image: AssetImage('assets/home_img.png'),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              const IconCategories(),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
      // drawer: const GenericDrawer(),
    );
  }
}
