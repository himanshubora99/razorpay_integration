import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:razorpay_payments/apis/api_calls.dart';
import 'package:razorpay_payments/apis/urls.dart';
import 'package:razorpay_payments/models/qr_code_request_model.dart';
import 'package:razorpay_payments/models/create_razorpay_payment_link_request_model.dart';
import 'package:razorpay_payments/models/create_razorpay_payment_link_response_model.dart';
import 'package:razorpay_payments/models/qr_code_response_model.dart';
import 'package:razorpay_payments/utils/enums.dart';
import 'package:razorpay_payments/utils/snackbar.dart';

class PaymentScreenProvider extends ChangeNotifier {
  static final ApiCall _apiCall = ApiCall();
  QRCodeResponse? _qrResponse;

  QRCodeResponse? get qrResponse => _qrResponse;
  int? futureDelayToInitiatePayment = 2;
  int? periodicTimeToCallCheckPaymentStatus = 5;
  int? howManyTimeTickerWillTick = 60;
  String? createdPaymentLinkId = '';

  Future<bool> callingCreateRazorPaymentLinkAPI(
      {required BuildContext context,
      required double totalAmountToBePaid,
      required String contactNo}) async {
    Notify notify = Notify(
      email: true,
      sms: true,
    );
    Customer createRazorpayPaymentLinkCustomerModel = Customer(
      contact: contactNo,
    );
    print('totalAmountToBePaidBefore:$totalAmountToBePaid');
    CreateRazorpayPaymentLinkRequestModel
        createRazorpayPaymentLinkRequestModel =
        CreateRazorpayPaymentLinkRequestModel(
      upiLink: true,
      amount: (totalAmountToBePaid * 100).roundToDouble(),
      customer: createRazorpayPaymentLinkCustomerModel,
      description: 'Razorpay Testing',
      expireBy:
          DateTime.now().add(const Duration(minutes: 3)).millisecondsSinceEpoch,
      notify: notify,
      reminderEnable: true,
    );
    final HTTPResponse httpResponse = await _apiCall.commonApiCallingFunction(
        apiType: APIType.post,
        finalURL:
            // kIsWeb
            //     ? CHANGE_PROXY_URL_FOR_WEB + RAZORPAY_PAYMENT_BASE_URL + POST_GET_RAZORPAY_PAYMENT_LINK_URL
            //     :
            ApiUrl.RAZORPAY_PAYMENT_BASE_URL + ApiUrl.RAZORPAY_PAYMENT_LINK_URL,
        context: context,
        sendingData: createRazorpayPaymentLinkRequestModel.toMap());
    if (httpResponse.isSuccessful) {
      createdPaymentLinkId =
          CreateRazorpayPaymentLinkResponseModel.fromMap(httpResponse.data).id;
      return true;
    } else {
      CustomShowMessageHelper.showSnackBar(
          context: context, message: httpResponse.message!);
      return false;
    }
  }

  Future<String> callingCreateQRCodeAPI({
    required BuildContext context,
    required double totalAmountToBePaid,
  }) async {
    QrNotes qrNotes = QrNotes(
      purpose: 'Test UPI QR code notes',
    );
    CreateQrCodeModel createQrCodeModel = CreateQrCodeModel(
      type: 'upi_qr',
      usage: 'multiple_use',
      description: 'Test QR Code',
      fixedAmount: true,
      name: 'Himanshu',
      paymentAmount: (totalAmountToBePaid * 100).toInt(),
      notes: qrNotes,
    );
    final HTTPResponse httpResponse = await _apiCall.commonApiCallingFunction(
        apiType: APIType.post,
        context: context,
        finalURL:
            // kIsWeb
            //     ? CHANGE_PROXY_URL_FOR_WEB + RAZORPAY_PAYMENT_BASE_URL + RAZORPAY_QR_CODE_URL
            //     :
            ApiUrl.RAZORPAY_PAYMENT_BASE_URL + ApiUrl.RAZORPAY_QR_CODE_URL,
        sendingData: createQrCodeModel.toMap());
    if (httpResponse.responseCode == 200) {
      return '';
      _qrResponse = QRCodeResponse.fromMap(httpResponse.data);
      // Future.delayed(Duration(seconds: futureDelayToInitiatePayment!), () {
      //   Timer.periodic(Duration(seconds: periodicTimeToCallCheckPaymentStatus!),
      //       (Timer timer) {
      //     if (timer.tick < howManyTimeTickerWillTick!) {
      //
      //     } else {
      //       timer.cancel();
      //     }
      //   });
      // });
    } else {
      return httpResponse.data['error']['description'];
    }
  }

  Future<void> qrAPICheck({
    required BuildContext context,
  }) async {
    final HTTPResponse httpResponse = await _apiCall.commonApiCallingFunction(
      context: context,
      apiType: APIType.get,
      finalURL:
          // kIsWeb
          //     ? CHANGE_PROXY_URL_FOR_WEB + RAZORPAY_PAYMENT_BASE_URL + RAZORPAY_QR_CODE_URL
          //     :
          '${ApiUrl.RAZORPAY_PAYMENT_BASE_URL}${ApiUrl.RAZORPAY_QR_CODE_URL}/${_qrResponse!.id}',
    );
    if (httpResponse.responseCode == 200) {
      _qrResponse = QRCodeResponse.fromMap(httpResponse.data);
    }
    return;
  }
}
