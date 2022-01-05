import 'package:flutter/material.dart';

import 'package:los_yoyos/src/util/const_text_style.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class MiniCard extends StatelessWidget {
  const MiniCard({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: lightRed, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ID', style: smallText),
          Text(id, overflow: TextOverflow.ellipsis, style: smallText),
        ],
      ),
    );
  }
}
