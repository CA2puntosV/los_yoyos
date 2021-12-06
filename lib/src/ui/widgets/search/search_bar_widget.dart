import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/widgets/search/search_delegate.dart';
import 'package:los_yoyos/src/util/const_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
            color: cardsColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: const [
              Icon(Icons.search),
              SizedBox(width: 10.0),
              Text('Search'),
            ],
          ),
        ),
        onTap: () {
          showSearch(
            context: context,
            delegate: DataSearch(),
          );
        },
      ),
    );
  }
}
