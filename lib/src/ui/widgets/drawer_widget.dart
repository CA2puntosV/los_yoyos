import 'package:flutter/material.dart';

class GenericDrawer extends StatelessWidget {
  const GenericDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Image(
              image: AssetImage('assets/logo_ly.png'),
            ),
          ),
        ],
      ),
    );
  }
}
