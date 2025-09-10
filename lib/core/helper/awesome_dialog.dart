import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

/*
 * showDialogMessage function
 * displays a customizable dialog using AwesomeDialog package
 * parameters include context, dialog type, title, description, and callbacks for OK and Cancel buttons
 */
void showDialogMessage(
  BuildContext context, {
  DialogType dialogType = DialogType.error,
  String title = "Error",
  String desc = "",
  VoidCallback? onOk,
  VoidCallback? onCancel,
}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    borderSide: const BorderSide(width: 2),
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(2)),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    desc: desc,
    showCloseIcon: true,
    btnCancelOnPress: onCancel,
    btnOkOnPress: onOk,
  ).show();
}
