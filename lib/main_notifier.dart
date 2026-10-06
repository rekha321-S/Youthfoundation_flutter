import 'package:flutter/material.dart';

import 'utils/constants.dart';


class MainNotifier extends ValueNotifier<bool> {
  MainNotifier() : super(false);

  void onScrollOffsetChanged(double offset) {
    final isExceedNavbar = offset > Constants.kNavigationBarHeight;

    if (value != isExceedNavbar) {
      value = isExceedNavbar;
    }
  }
}