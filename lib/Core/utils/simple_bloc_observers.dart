import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObservers extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('onChange: $change');
  }

// @override
// void onClose(BlocBase bloc) {
//   super.onClose(bloc);
//   debugPrint('onClose: $bloc');
// }
//
// @override
// void onCreate(BlocBase bloc) {
//   super.onCreate(bloc);
//   debugPrint('onCreate: $bloc');
// }
}
