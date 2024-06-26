import 'package:flutter/material.dart';

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus &&
      currentFocus.focusedChild != null) {
    currentFocus.focusedChild?.unfocus();
  }
}