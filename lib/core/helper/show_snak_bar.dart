import 'package:flutter/material.dart';


/*
 * showSnakBar function
 * displays a SnackBar with a given message in the provided context
 */
void showSnakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
