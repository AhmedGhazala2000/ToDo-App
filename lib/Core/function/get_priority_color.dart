import 'package:flutter/material.dart';

getPriorityColor(String priority) {
  switch (priority.toLowerCase()) {
    case 'low':
      return const Color(0xff0087FF);
    case 'medium':
      return const Color(0xff5F33E1);
    case 'high':
      return const Color(0xffFF7D53);
  }
}
