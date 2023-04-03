import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen(this.currentFilters ,this.saveFilters);

  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue as void Function(bool?)?,
    );
  }

  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Customization',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchTile(
                    'Gluten-Free',
                    'Only include Gluten-Free meals',
                    _glutenFree,
                    (value) {
                      setState(
                        () {
                          _glutenFree = value;
                        },
                      );
                    },
                  ),
                  buildSwitchTile(
                    'Lactose-Free',
                    'Only include Lactose-Free meals',
                    _lactoseFree,
                    (value) {
                      setState(
                        () {
                          _lactoseFree = value;
                        },
                      );
                    },
                  ),
                  buildSwitchTile(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    _vegetarian,
                    (value) {
                      setState(
                        () {
                          _vegetarian = value;
                        },
                      );
                    },
                  ),
                  buildSwitchTile(
                    'Vegan',
                    'Only include Vegan meals',
                    _vegan,
                    (value) {
                      setState(
                        () {
                          _vegan = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          },
          child: const Icon(Icons.save),
        ));
  }
}
