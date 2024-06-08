import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Core/utils/local_network.dart';

import '../home_view.dart';
import 'select_tasks_item.dart';

class SelectTasksItemsListView extends StatelessWidget {
  const SelectTasksItemsListView({Key? key}) : super(key: key);

  static const List<String> listItems = [
    'All',
    'Inprogress',
    'Waiting',
    'Finished',
  ];

  @override
  Widget build(BuildContext context) {
    final localCached = CachedNetwork.sharedPref;
    final currentSelectedIndex = localCached.getInt(kCurrentSelectedIndex);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        itemCount: listItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (currentSelectedIndex != index) {
                localCached.setInt(kCurrentSelectedIndex, index);
                localCached.setString(kStatus, listItems[index]);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.id,
                  (route) => false,
                  arguments: listItems[index],
                );
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
