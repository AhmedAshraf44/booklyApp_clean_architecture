import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("onClose: $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log("onCreate: $bloc");
  }
}
