import 'package:flutter/material.dart';

import 'package:los_yoyos/src/ui/widgets/search/search_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: InkWell(
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
            children: const [
              Text('Type to search'),
              Expanded(child: SizedBox()),
              Icon(Icons.search),
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
