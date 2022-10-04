import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filters";
  const FiltersScreen(this.filters, this.saveFilters, {super.key});

  final Function saveFilters;
  final Map<String, bool> filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegen = false;
  bool _lactosFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters["gluten"] as bool;
    _vegetarian = widget.filters["vegetarian"] as bool;
    _vegen = widget.filters["vegan"] as bool;
    _lactosFree = widget.filters["lactose"] as bool;
    super.initState();
  }

  Widget _bulidSwitcListTile(
      String title, String desc, bool current, Function(bool) update) {
    return SwitchListTile(
      value: current,
      onChanged: update,
      title: Text(title),
      subtitle: Text(desc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () => widget.saveFilters({
                    "gluten": _glutenFree,
                    "lactose": _lactosFree,
                    "vegan": _vegen,
                    "vegetarian": _vegetarian,
                  }),
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _bulidSwitcListTile(
              "Gluten-free",
              "Only include gluten-free meals.",
              _glutenFree,
              (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              },
            ),
            _bulidSwitcListTile(
              "Lactos-free",
              "Only include lactos-free meals.",
              _lactosFree,
              (newValue) {
                setState(() {
                  _lactosFree = newValue;
                });
              },
            ),
            _bulidSwitcListTile(
              "Vegetarian",
              "Only include vegetarian meals.",
              _vegetarian,
              (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              },
            ),
            _bulidSwitcListTile(
              "Vegen",
              "Only include vegen meals.",
              _vegen,
              (newValue) {
                setState(() {
                  _vegen = newValue;
                });
              },
            ),
          ],
        ))
      ]),
    );
  }
}
