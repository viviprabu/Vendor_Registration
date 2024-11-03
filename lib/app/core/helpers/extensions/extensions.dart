// 🎯 Dart imports:
import 'dart:math';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

export '_build_context_extensions.dart';

extension ListExtension<T> on List<T> {
  List<T> addBetween(T separator) {
    if (length <= 1) return toList();

    final newItems = <T>[];
    for (int i = 0; i < length - 1; i++) {
      newItems.add(this[i]);
      newItems.add(separator);
    }
    newItems.add(this[length - 1]);

    return newItems;
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1440) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
