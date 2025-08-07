import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app04/provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: Text(' Your Filters')),

      body: Column(
        children: [
          custemSwitch(
            context,
            'Gluten-Free',
            'only include gluten-free meals',
            activeFilter[Filter.glutenFree]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .stateFilter(Filter.glutenFree, value),
          ),
          custemSwitch(
            context,
            'Lactose-Free',
            'only include lactose-free meals',
            activeFilter[Filter.lactoseFree]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .stateFilter(Filter.lactoseFree, value),
          ),
          custemSwitch(
            context,
            'Vegan',
            'only include vegan meals',
            activeFilter[Filter.vegan]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .stateFilter(Filter.vegan, value),
          ),
          custemSwitch(
            context,
            'Vegetarian',
            'only include vegetarian meals',
            activeFilter[Filter.vegetarian]!,
            (bool value) => ref
                .read(filtersProvider.notifier)
                .stateFilter(Filter.vegetarian, value),
          ),
        ],
      ),
    );
  }

  SwitchListTile custemSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newValue) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
      value: filter, // Replace with actual filter value
      onChanged: onChanged, // Replace with actual filter change handler
    );
  }
}
