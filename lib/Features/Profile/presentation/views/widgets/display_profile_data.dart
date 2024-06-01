import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'package:todo_app/Features/Profile/data/models/user_model.dart';

import 'custom_list_tile.dart';

class DisplayProfileData extends StatelessWidget {
  const DisplayProfileData({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(title: 'NAME', subtitle: user.displayName!),
            CustomListTile(
              title: 'PHONE',
              subtitle: user.username!,
              trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: user.username!),
                  ).then(
                    (_) => Fluttertoast.showToast(
                      msg: 'Copied to clipboard',
                      backgroundColor: const Color(0xffF5F5F5),
                      textColor: const Color(0xff2F2F2F),
                    ),
                  );
                },
                icon: const Icon(Icons.copy, color: kPrimaryColor),
              ),
            ),
            CustomListTile(title: 'LEVEL', subtitle: user.level!),
            CustomListTile(
                title: 'YEARS OF EXPERIENCE',
                subtitle: user.experienceYears!.toString()),
            CustomListTile(title: 'LOCATION', subtitle: user.address!),
          ],
        ),
      ),
    );
  }
}
