import 'package:flutter/material.dart';

class MealsDrawer extends StatelessWidget {
  const MealsDrawer({super.key, required this.onselectTile});
  final void Function(String identifier) onselectTile;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.onPrimaryContainer,
                  Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer.withAlpha(200),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 28,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.food_bank_outlined,
              size: 28,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
            ),
            onTap: () {
              onselectTile('Meals');
            },
          ),

          ListTile(
            leading: Icon(
              Icons.filter_alt_outlined,
              size: 28,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Filter',
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
            ),
            onTap: () {
              onselectTile('Filter');
            },
          ),
        ],
      ),
    );
  }
}
