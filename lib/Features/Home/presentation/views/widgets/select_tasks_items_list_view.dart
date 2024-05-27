import 'package:flutter/material.dart';

import 'select_tasks_item.dart';

class SelectTasksItemsListView extends StatefulWidget {
  const SelectTasksItemsListView({super.key});

  @override
  State<SelectTasksItemsListView> createState() =>
      _SelectTasksItemsListViewState();
}

class _SelectTasksItemsListViewState extends State<SelectTasksItemsListView> {
  static const List<String> listItems = [
    'All',
    'Inprogress',
    'Waiting',
    'Finished',
  ];
  int currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: listItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (currentSelectedIndex != index) {
                setState(() {
                  currentSelectedIndex = index;
                });
              }
            },
            child: SelectTasksItem(
              text: listItems[index],
              isSelected: currentSelectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
