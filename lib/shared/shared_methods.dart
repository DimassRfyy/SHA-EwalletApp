import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: Duration(seconds: 3),
  ).show(context);
}

String formatCurrency(num number, {String symbol = 'Rp '}) {
  return NumberFormat.currency(
    locale: 'id_ID',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

Future<XFile?> selectImage() async {
  XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  return selectedImage;
}
