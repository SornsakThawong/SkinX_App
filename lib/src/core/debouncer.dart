import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final int milliseconds;
  // VoidCallback? action;
  Timer? _timer;

  Debouncer({this.milliseconds = 500});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

//  _debouncer.run(() {
//     print(string);
//     //perform search here
//   }


// class Debouncer {
//   final Duration? delay;
//   Timer? _timer;

//   Debouncer({this.delay});

//   void call(void Function() action) {
//     _timer?.cancel();
//     _timer = Timer(delay!, action);
//   }

//   /// Notifies if the delayed call is active.
//   bool get isRunning => _timer?.isActive ?? false;

//   /// Cancel the current delayed call.
//   void cancel() => _timer?.cancel();
// }