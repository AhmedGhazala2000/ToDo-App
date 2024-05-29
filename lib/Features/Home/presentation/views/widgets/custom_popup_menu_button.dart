import 'package:flutter/material.dart';
import 'package:todo_app/Core/utils/styles.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key, this.onTapEdit, this.onTapDelete});

  final void Function()? onTapEdit;
  final void Function()? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          onTap: onTapEdit,
          child: Text(
            'Edit',
            style: AppStyles.styleMedium12.copyWith(
              fontSize: 16,
              color: const Color(0xff00060D),
            ),
          ),
        ),
        const IndentedDivider(),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          onTap: onTapDelete,
          child: Text(
            'Delete',
            style: AppStyles.styleMedium12.copyWith(
              fontSize: 16,
              color: const Color(0xffFF7D53),
            ),
          ),
        ),
      ],
      child: const Icon(
        Icons.more_vert,
        color: Colors.black,
      ),
    );
  }
}

class IndentedDivider extends PopupMenuEntry<String> {
  const IndentedDivider({super.key});

  @override
  State<IndentedDivider> createState() => _IndentedDividerState();

  @override
  double get height => throw UnimplementedError();

  @override
  bool represents(String? value) {
    throw UnimplementedError();
  }
}

class _IndentedDividerState extends State<IndentedDivider> {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      indent: 16,
      endIndent: 16,
    );
  }
}
