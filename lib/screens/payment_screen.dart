import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_payments/providers/payment_screen_provider.dart';
import 'package:razorpay_payments/utils/assets_path.dart';
import 'package:razorpay_payments/utils/colors.dart';
import 'package:razorpay_payments/utils/empty_padding.dart';
import 'package:razorpay_payments/utils/razorpay_logo.dart';
import 'package:razorpay_payments/utils/snackbar.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final TextEditingController _amountController =
      TextEditingController(text: '1');
  final TextEditingController _userNameController =
      TextEditingController(text: 'Himanshu Bora');
  final TextEditingController _contactNoController =
      TextEditingController(text: '9012965839');
  final TextEditingController _emailIdController =
      TextEditingController(text: 'himanshubora98@gmail.com');

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentScreenProvider(),
      builder: (BuildContext context, Widget? widget) => Scaffold(
        backgroundColor: CustomColors.PAYMENT_PAGE_BG_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const RazorPayLogo(),
                20.ph,
                userForm(),
                20.ph,
                const Text('How do you Like to Pay ?',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                20.ph,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      customPayButton(
                          string: 'Online',
                          onPressed: () {
                            // if (Platform.isAndroid || Platform.isIOS) {
                            // } else {
                            // CustomShowMessageHelper.showSnackBar(context: context, message:'This Feature is Only Available for Android And IOs');
                            // }
                          }),
                      customPayButton(
                          string: 'Send Link',
                          onPressed: () {
                            if (_contactNoController.text.length == 10) {
                              if (_amountController.text.isNotEmpty &&
                                  double.parse(_amountController.text) >= 1) {
                                context
                                    .read<PaymentScreenProvider>()
                                    .callingCreateRazorPaymentLinkAPI(
                                        context: context,
                                        totalAmountToBePaid: double.parse(
                                            _amountController.text),
                                        contactNo: _contactNoController.text);
                              } else {
                                CustomShowMessageHelper.showSnackBar(
                                    context: context,
                                    message: 'Amount Should be greater than 1');
                              }
                            } else {
                              CustomShowMessageHelper.showSnackBar(
                                  context: context,
                                  message:
                                      'Please Enter Your 10 digit Contact No. correctly');
                            }
                          }),
                      customPayButton(string: 'QR Code', onPressed: () async{
                        context
                            .read<PaymentScreenProvider>().callingCreateQRCodeAPI(context: context,totalAmountToBePaid: double.parse(
                            _amountController.text)).then((String value) {
                        });
                      }),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userForm() {
    return StatefulBuilder(
        builder: (BuildContext formContext, StateSetter formState) {
      return Form(
        onChanged: () {
          formState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.BLUE_COLOR1,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(formContext).size.height / 20,
            horizontal: MediaQuery.of(formContext).size.width / 10,
          ),
          child: Column(
            children: <Widget>[
              TextFormField(
                style: const TextStyle(color: CustomColors.WHITE_COLOR),
                decoration: InputDecoration(
                  labelText: 'Amount',
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.currency_rupee,
                      color: CustomColors.WHITE_COLOR),
                  labelStyle: const TextStyle(color: CustomColors.WHITE_COLOR),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                ],
                controller: _amountController,
                onChanged: (_) {
                  // formState(() {});
                },
              ),
              20.ph,
              const Text('User Details',
                  style: TextStyle(
                      color: CustomColors.WHITE_COLOR,
                      fontWeight: FontWeight.w600)),
              20.ph,
              TextFormField(
                maxLength: 30,
                style: const TextStyle(color: CustomColors.WHITE_COLOR),
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: const TextStyle(color: CustomColors.WHITE_COLOR),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                ),
                inputFormatters: <TextInputFormatter>[],
                controller: _userNameController,
                onChanged: (_) {
                  // formState(() {});
                },
              ),
              20.ph,
              TextFormField(
                maxLength: 10,
                style: const TextStyle(color: CustomColors.WHITE_COLOR),
                decoration: InputDecoration(
                  labelText: 'Contact No',
                  labelStyle: const TextStyle(color: CustomColors.WHITE_COLOR),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _contactNoController,
                onChanged: (_) {
                  // formState(() {});
                },
              ),
              20.ph,
              TextFormField(
                style: const TextStyle(color: CustomColors.WHITE_COLOR),
                decoration: InputDecoration(
                  labelText: 'Email Id',
                  labelStyle: const TextStyle(color: CustomColors.WHITE_COLOR),
                  counterText: '',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: CustomColors.WHITE_COLOR),
                  ),
                ),
                inputFormatters: <TextInputFormatter>[],
                controller: _emailIdController,
                onChanged: (_) {
                  formState(() {});
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget customPayButton({
    required void Function()? onPressed,
    required String string,
  }) {
    return SizedBox(
      height: 40,
      // width: 160,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(CustomColors.GREEN_400_COLOR),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(RAZORPAY_ICON, height: 20, width: 20),
              5.pw,
              Text(string,
                  style: const TextStyle(
                      color: CustomColors.WHITE_COLOR,
                      fontWeight: FontWeight.w600)),
            ],
          )),
    );
  }
}
