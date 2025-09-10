import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

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
