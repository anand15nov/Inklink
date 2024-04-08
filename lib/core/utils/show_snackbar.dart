import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()// if there are 2 snackbars we want to see recent 1
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}
