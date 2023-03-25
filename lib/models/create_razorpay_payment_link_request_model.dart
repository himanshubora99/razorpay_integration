import 'dart:convert';

CreateRazorpayPaymentLinkRequestModel createRazorpayPaymentLinkRequestModelFromMap(String str) => CreateRazorpayPaymentLinkRequestModel.fromMap(json.decode(str));

String createRazorpayPaymentLinkRequestModelToMap(CreateRazorpayPaymentLinkRequestModel data) => json.encode(data.toMap());

class CreateRazorpayPaymentLinkRequestModel {
  CreateRazorpayPaymentLinkRequestModel({
    this.amount,
    this.currency,
    this.acceptPartial,
    this.firstMinPartialAmount,
    this.expireBy,
    this.referenceId,
    this.description,
    this.customer,
    this.notify,
    this.reminderEnable,
    this.notes,
    this.callbackUrl,
    this.callbackMethod,
    this.upiLink,
  });

  double? amount;
  String? currency;
  bool? acceptPartial;
  double? firstMinPartialAmount;
  int? expireBy;
  String? referenceId;
  String? description;
  Customer? customer;
  Notify? notify;
  bool? reminderEnable;
  Notes? notes;
  String? callbackUrl;
  String? callbackMethod;
  bool? upiLink;

  factory CreateRazorpayPaymentLinkRequestModel.fromMap(Map<String, dynamic> json) => CreateRazorpayPaymentLinkRequestModel(
    amount: json["amount"],
    currency: json["currency"],
    acceptPartial: json["accept_partial"],
    firstMinPartialAmount: json["first_min_partial_amount"],
    expireBy: json["expire_by"],
    referenceId: json["reference_id"],
    description: json["description"],
    customer: json["customer"] == null ? null : Customer.fromMap(json["customer"]),
    notify: json["notify"] == null ? null : Notify.fromMap(json["notify"]),
    reminderEnable: json["reminder_enable"],
    notes: json["notes"] == null ? null : Notes.fromMap(json["notes"]),
    callbackUrl: json["callback_url"],
    callbackMethod: json["callback_method"],
    upiLink: json["upi_link"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "currency": currency,
    "accept_partial": acceptPartial,
    "first_min_partial_amount": firstMinPartialAmount,
    "expire_by": expireBy,
    "reference_id": referenceId,
    "description": description,
    "customer": customer?.toMap(),
    "notify": notify?.toMap(),
    "reminder_enable": reminderEnable,
    "notes": notes?.toMap(),
    "callback_url": callbackUrl,
    "callback_method": callbackMethod,
    "upi_link": upiLink,
  };
}

class Customer {
  Customer({
    this.name,
    this.contact,
    this.email,
  });

  String? name;
  String? contact;
  String? email;

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
    name: json["name"],
    contact: json["contact"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "contact": contact,
    "email": email,
  };
}

class Notes {
  Notes({
    this.policyName,
  });

  String? policyName;

  factory Notes.fromMap(Map<String, dynamic> json) => Notes(
    policyName: json["policy_name"],
  );

  Map<String, dynamic> toMap() => {
    "policy_name": policyName,
  };
}

class Notify {
  Notify({
    this.sms,
    this.email,
  });

  bool? sms;
  bool? email;

  factory Notify.fromMap(Map<String, dynamic> json) => Notify(
    sms: json["sms"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "sms": sms,
    "email": email,
  };
}
