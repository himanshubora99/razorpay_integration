import 'package:flutter/material.dart';

import 'assets_path.dart';

class RazorPayLogo extends StatelessWidget {
  const RazorPayLogo({this.isWhiteLogo = false, Key? key}) : super(key: key);
  final bool isWhiteLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height <=230?50: MediaQuery.of(context).size.height / 6 ,
      child: Image.asset(
        fit: BoxFit.contain,
          isWhiteLogo ? RAZORPAY_WHITE_LOGO : RAZORPAY_BLUE_LOGO),
    );
  }
}
