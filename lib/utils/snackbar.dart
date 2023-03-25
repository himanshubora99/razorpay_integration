import 'package:flutter/material.dart';
import 'package:razorpay_payments/utils/colors.dart';

class CustomShowMessageHelper {
  // SHOW SnackBar MESSAGES
  static void showSnackBar(
      {required String message,required BuildContext context,}) {
    try {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: CustomColors.GREEN_COLOR,
          content: Text( message,
            style: const TextStyle(color: CustomColors.WHITE_COLOR,),
          )));
    } on Exception {
      return;
    }
  }

}