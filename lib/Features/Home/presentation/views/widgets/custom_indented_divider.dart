import 'package:flutter/material.dart';

class CustomIndentedDivider extends PopupMenuEntry<String> {
  const CustomIndentedDivider({super.key});

  @override
  State<CustomIndentedDivider> createState() => _IndentedDividerState();

  @override
  double get height => throw UnimplementedError();

  @override
  bool represents(String? value) {
    throw UnimplementedError();
  }
}

class _IndentedDividerState extends State<CustomIndentedDivider> {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      indent: 16,
      endIndent: 16,
    );
  }
}
