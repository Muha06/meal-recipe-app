import 'package:flutter/material.dart';

import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final filters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filters.glutenFree]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.glutenFree, newvalue);
            },
            contentPadding: const EdgeInsets.only(left: 18, right: 18),
            //the round thumb
            activeThumbColor: Theme.of(context).colorScheme.onPrimary,
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
            value: filters[Filters.lactoseFree]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.lactoseFree, newvalue);
            },
            contentPadding: const EdgeInsets.only(left: 18, right: 18),
            //the round thumb
            activeThumbColor: Theme.of(context).colorScheme.onPrimary,
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
            value: filters[Filters.vegetarian]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegetarian, newvalue);
            },
            contentPadding: const EdgeInsets.only(left: 18, right: 18),
            //the round thumb
            activeThumbColor: Theme.of(context).colorScheme.onPrimary,
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
            value: filters[Filters.vegan]!,
            onChanged: (newvalue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filters.vegan, newvalue);
            },
            contentPadding: const EdgeInsets.only(left: 18, right: 18),
            //the round thumb
            activeThumbColor: Theme.of(context).colorScheme.onPrimary,
            activeTrackColor: Theme.of(context).colorScheme.primary,
            title: Text('Vegan', style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text(
              'Only vegan meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
