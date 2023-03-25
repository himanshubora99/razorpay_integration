
import 'package:razorpay_payments/models/create_razorpay_payment_link_request_model.dart';

class CreateRazorpayPaymentLinkResponseModel {
  CreateRazorpayPaymentLinkResponseModel({
    this.acceptPartial,
    this.amount,
    this.amountPaid,
    this.callbackMethod,
    this.callbackUrl,
    this.cancelledAt,
    this.createdAt,
    this.currency,
    this.customer,
    this.description,
    this.expireBy,
    this.expiredAt,
    this.firstMinPartialAmount,
    this.id,
    this.notes,
    this.notify,
    this.payments,
    this.referenceId,
    this.reminderEnable,
    this.reminders,
    this.shortUrl,
    this.status,
    this.updatedAt,
    this.upiLink,
    this.userId,
  });

  bool? acceptPartial;
  double? amount;
  double? amountPaid;
  String? callbackMethod;
  String? callbackUrl;
  int? cancelledAt;
  int? createdAt;
  String? currency;
  Customer? customer;
  String? description;
  int? expireBy;
  int? expiredAt;
  int? firstMinPartialAmount;
  String? id;
  Notes? notes;
  Notify? notify;
  dynamic payments;
  String? referenceId;
  bool? reminderEnable;
  List<dynamic>? reminders;
  String? shortUrl;
  String? status;
  int? updatedAt;
  bool? upiLink;
  String? userId;

  factory CreateRazorpayPaymentLinkResponseModel.fromMap(
      Map<String, dynamic> json) =>
      CreateRazorpayPaymentLinkResponseModel(
        acceptPartial: json["accept_partial"],
        amount: json["amount"].toDouble(),
        amountPaid: json["amount_paid"].toDouble(),
        callbackMethod: json["callback_method"],
        callbackUrl: json["callback_url"],
        cancelledAt: json["cancelled_at"],
        createdAt: json["created_at"],
        currency: json["currency"],
        customer:
        Customer.fromMap(json["customer"]),
        description: json["description"],
        expireBy: json["expire_by"],
        expiredAt: json["expired_at"],
        firstMinPartialAmount: json["first_min_partial_amount"],
        id: json["id"],
        notes: json["notes"] == null
            ? json["notes"]
            : Notes.fromMap(json["notes"]),
        notify: Notify.fromMap(json["notify"]),
        payments: json["payments"],
        referenceId: json["reference_id"],
        reminderEnable: json["reminder_enable"],
        reminders: List<dynamic>.from(json["reminders"].map((x) => x)),
        shortUrl: json["short_url"],
        status: json["status"],
        updatedAt: json["updated_at"],
        upiLink: json["upi_link"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "accept_partial": acceptPartial,
    "amount": amount,
    "amount_paid": amountPaid,
    "callback_method": callbackMethod,
    "callback_url": callbackUrl,
    "cancelled_at": cancelledAt,
    "created_at": createdAt,
    "currency": currency,
    "customer": customer!.toMap(),
    "description": description,
    "expire_by": expireBy,
    "expired_at": expiredAt,
    "first_min_partial_amount": firstMinPartialAmount,
    "id": id,
    "notes": notes!.toMap(),
    "notify": notify!.toMap(),
    "payments": payments,
    "reference_id": referenceId,
    "reminder_enable": reminderEnable,
    "reminders": List<dynamic>.from(reminders!.map((x) => x)),
    "short_url": shortUrl,
    "status": status,
    "updated_at": updatedAt,
    "upi_link": upiLink,
    "user_id": userId,
  };
}
