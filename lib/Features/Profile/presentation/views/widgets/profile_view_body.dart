import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/Core/utils/constant.dart';
import 'custom_list_tile.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const CustomListTile(title: 'NAME', subtitle: 'Islam Sayed'),
          CustomListTile(
            title: 'Phone',
            subtitle: '+20 123 456-7890',
            trailing: IconButton(
              onPressed: () {
                Clipboard.setData(
                  const ClipboardData(text: '+20 123 456-7890'),
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
          const CustomListTile(title: 'LEVEL', subtitle: 'Senior'),
          const CustomListTile(
              title: 'Years of experience', subtitle: '7 years'),
          const CustomListTile(title: 'Location', subtitle: 'Mansoura, Egypt'),
        ],
      ),
    );
  }
}
