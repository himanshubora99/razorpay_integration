// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dart_developer;
import 'package:razorpay_payments/apis/api_keys.dart';
import 'package:razorpay_payments/utils/enums.dart';
import 'package:razorpay_payments/utils/snackbar.dart';

class ApiCall {
  static const String RAZORPAY_CONTENT_TYPE = 'application/json';
  static const String SOMETHING_WENT_WRONG_PLEASE_TRY_AGAIN_TEXT =
      'something went wrong please try again';

  Future<HTTPResponse> commonApiCallingFunction(
      {required APIType apiType,
      required String finalURL,
      required BuildContext context,
      Map<String?, dynamic>? sendingData}) async {
    dynamic data;
    try {
      final http.Response response = await detectApiType(
        apiType: apiType,
        url: Uri.parse(finalURL),
        data: jsonEncode(sendingData),
      );
      dart_developer.log(
          'API LOG: ~~~~~ ${response.statusCode} ~~~~~ $finalURL ~~~~~ ${jsonEncode(sendingData)} ~~~~~ ${response.body} ~~~~~ ');
      data = jsonDecode(response.body);
      switch (response.statusCode) {
        case 200:
          return HTTPResponse(true, data, responseCode: response.statusCode);
        case 201:
          return HTTPResponse(true, data, responseCode: response.statusCode);
        default:
          return HTTPResponse(false, data,
              message: SOMETHING_WENT_WRONG_PLEASE_TRY_AGAIN_TEXT,
              responseCode: response.statusCode);
      }
    } on SocketException {
      String unableToReachInternet = 'Unable To Reach Internet';
      CustomShowMessageHelper.showSnackBar(
          context: context, message: unableToReachInternet);
      return HTTPResponse(
        false,
        data,
        message: unableToReachInternet,
      );
    } on FormatException {
      const String INVALID_RESPONSE_FROM_SERVER_TEXT =
          'Invalid response from server';
      return HTTPResponse(
        false,
        data,
        message: INVALID_RESPONSE_FROM_SERVER_TEXT,
      );
    } on Exception catch (e, s) {
      return HTTPResponse(false, data,
          message: SOMETHING_WENT_WRONG_PLEASE_TRY_AGAIN_TEXT);
    }
  }

  /* ------------------          POST REQUESTS           --------------------------------------------   */
  Future<http.Response> postRequestAPI({
    required Uri url,
    required data,
  }) async {
    final http.Response response = await http.post(
      url,
      headers: header(),
      body: data,
    );
    return response;
  }

  /* ------------------------       GET REQUESTS           -------------------------------------------   */
  Future<http.Response> getRequestApi({
    required Uri url,
  }) async {
    final http.Response response = await http.get(
      url,
      headers: header(),
    );
    return response;
  }

  Map<String, String> header() {
    String basicAuth =
        'Basic ${base64.encode(utf8.encode('${ApiKeys.RAZORPAY_KEY_ID}:${ApiKeys.RAZORPAY_KEY_SECRET}'))}';
    return <String, String>{
      'authorization': basicAuth,
      'Content-Type': RAZORPAY_CONTENT_TYPE
    };
  }

  Future detectApiType({
    required APIType apiType,
    required Uri url,
    data,
  }) async {
    switch (apiType) {
      case APIType.post:
        return await postRequestAPI(
          url: url,
          data: data,
        );
      case APIType.get:
        return await getRequestApi(
          url: url,
        );
    }
  }
}

class HTTPResponse<T> {
  bool isSuccessful;
  var data;
  String? message;
  int? responseCode;

  HTTPResponse(this.isSuccessful, this.data, {this.message, this.responseCode});
}
