import 'package:flutter/material.dart';

getStatusTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'waiting':
      return const Color(0xffFF7D53);
    case 'inprogress':
      return const Color(0xff5F33E1);
    case 'finished':
      return const Color(0xff0087FF);
  }
}
