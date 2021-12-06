import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:los_yoyos/src/models/employees_models.dart';
import 'package:los_yoyos/src/services/los_yoyos_api.dart';

class DataSearch extends SearchDelegate {
  final LosYoyosApi _yoyosApi = LosYoyosApi();

  List<Employee> _filter = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center();
    }

    return FutureBuilder<List<Employee>>(
        future: _yoyosApi.getEmployees(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Employee>? data = snapshot.data;

            _filter = data!.where((element) {
              return element.name.toLowerCase().startsWith(query.toLowerCase());
            }).toList();

            return ListView.builder(
                itemCount: _filter.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filter[index].name),
                    onTap: () {},
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Try searching someone... '),
            SvgPicture.asset('assets/searching.svg', width: 280.0),
          ],
        ),
      );
    }

    return FutureBuilder(
      future: _yoyosApi.getEmployees(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Employee>? data = snapshot.data as List<Employee>?;

          _filter = data!.where((element) {
            return element.name.toLowerCase().startsWith(query.toLowerCase());
          }).toList();

          return ListView.builder(
              itemCount: _filter.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filter[index].name),
                  onTap: () {},
                );
              });
        } else {
          return const Center();
        }
      },
    );
  }
}
