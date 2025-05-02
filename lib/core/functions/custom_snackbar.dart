import 'package:flutter/material.dart';

customSnackBar(context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(error),
    ),
  );
}
