import 'package:flutter/material.dart';
import 'package:razorpay_payments/screens/payment_screen.dart';
import 'package:razorpay_payments/utils/assets_path.dart';
import 'package:razorpay_payments/utils/colors.dart';
import 'package:razorpay_payments/utils/constant_strings.dart';
import 'package:razorpay_payments/utils/razorpay_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BLUE_COLOR,
      body: Column(
        children: <Widget>[
          _homePageText(string: RAZORPAY_PAYMENT_STRING),
          const RazorPayLogo(isWhiteLogo: true),
          _homePageText(string: SEND_AND_RECEIVE_MONEY_STRING),
          _homePageText(string: USING_RAZORPAY_STRING),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(CustomColors.WHITE_COLOR),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PaymentScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(RAZORPAY_ICON,height: 20,width: 20),
                    SizedBox(width: 5,),
                    _homePageText(
                      string: RAZOR_PAY_STRING,
                      color: CustomColors.BLUE_COLOR,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget _homePageText({required String string, Color? color}) {
    return Text(string,
        style: TextStyle(
            color: color ?? CustomColors.WHITE_COLOR, fontWeight: FontWeight.w600));
  }
}
