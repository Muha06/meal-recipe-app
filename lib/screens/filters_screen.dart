import 'package:flutter/material.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeChecked = false;
  var _lactoseFreeChecked = false;
  var _vegetarianChecked = false;
  var _veganChecked = false;

  //before building the UI it sets the filters to the previously set by user
  @override
  void initState() {
    super.initState();
    _glutenFreeChecked = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFreeChecked = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianChecked = widget.currentFilters[Filters.vegetarian]!;
    _veganChecked = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, result) {
          if (didPop) return;
          //when popping back, return this map
          //keys of this map is a enum value and its value is a bool
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFreeChecked,
            Filters.lactoseFree: _lactoseFreeChecked,
            Filters.vegan: _veganChecked,
            Filters.vegetarian: _vegetarianChecked,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeChecked,
              onChanged: (newvalue) {
                setState(() {
                  _glutenFreeChecked = newvalue;
                });
              },
              contentPadding: const EdgeInsets.only(left: 18, right: 18),
              //the round thumb
              activeThumbColor: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Gluten Free',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only Gluten Free meals',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeChecked,
              onChanged: (newvalue) {
                setState(() {
                  _lactoseFreeChecked = newvalue;
                });
              },
              contentPadding: const EdgeInsets.only(left: 18, right: 18),
              //the round thumb
              activeThumbColor: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only Lactose Free meals',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SwitchListTile(
              value: _vegetarianChecked,
              onChanged: (newvalue) {
                setState(() {
                  _vegetarianChecked = newvalue;
                });
              },
              contentPadding: const EdgeInsets.only(left: 18, right: 18),
              //the round thumb
              activeThumbColor: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SwitchListTile(
              value: _veganChecked,
              onChanged: (newvalue) {
                setState(() {
                  _veganChecked = newvalue;
                });
              },
              contentPadding: const EdgeInsets.only(left: 18, right: 18),
              //the round thumb
              activeThumbColor: Theme.of(
                context,
              ).colorScheme.onPrimaryContainer,
              activeTrackColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'Only vegan meals',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
