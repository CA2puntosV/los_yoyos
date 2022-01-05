import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/widgets/drawer_widget.dart';
import 'package:los_yoyos/src/util/const_colors.dart';
import 'package:los_yoyos/src/util/const_text_style.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  //Constant Widgets
  final divider = const Divider(
    color: Colors.white,
    indent: 20.0,
    endIndent: 20.0,
  );

  Widget textSeparator() {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Text(
        'Contrary to popular belief, Lorem Ipsum is not simply random text. "Lorem ipsum dolor sit amet.."',
        style: TextStyle(
          color: Colors.white70,
          fontFamily: 'PTSans',
          fontSize: 15.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              divider,
              companyUbication(context),
              textSeparator(),
              companyImages(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
            'About Us',
            style: TextStyle(
              fontFamily: 'PTSans',
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 10.0),
          CircleAvatar(
            child: const Image(
              image: AssetImage(
                'assets/logo_ly.png',
              ),
            ),
            minRadius: 30.0,
            maxRadius: 50.0,
            backgroundColor: lightRed,
          ),
          const SizedBox(height: 10.0),
          Text('Los Yoyos', style: bigText(null)),
          const SizedBox(height: 10.0),
          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: TextStyle(color: Colors.white70, fontFamily: 'PTSans'),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () {},
                color: lightRed,
              ),
              IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {},
                color: Colors.orange,
              ),
              IconButton(
                icon: const Icon(Icons.email),
                onPressed: () {},
                color: lightRed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget companyUbication(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 4,
            child: const Center(
              child: Text('TODO: Implement Google Map'),
            ),
          ),
          const Icon(
            Icons.place,
            color: Colors.red,
            size: 50.0,
          ),
        ],
      ),
    );
  }

  Widget companyImages(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            imagesList(
              'assets/abu_images/team_work.jpg',
              'assets/abu_images/office.jpg',
            ),
            imagesList(
              'assets/abu_images/conf_room.jpg',
              'assets/abu_images/conf.jpg',
            ),
            imagesList(
              'assets/abu_images/couple_tw.jpg',
              'assets/abu_images/girl_c.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget imagesList(String img1, String img2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(img1),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Image.asset(img2),
          ),
        ],
      ),
    );
  }
}
