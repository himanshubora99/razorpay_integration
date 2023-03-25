import 'dart:convert';

CreateQrCodeModel createQrCodeModelFromMap(String str) => CreateQrCodeModel.fromMap(json.decode(str));

String createQrCodeModelToMap(CreateQrCodeModel data) => json.encode(data.toMap());

class CreateQrCodeModel {
  CreateQrCodeModel({
    this.type,
    this.name,
    this.usage,
    this.fixedAmount,
    this.paymentAmount,
    this.description,
    this.customerId,
    this.closeBy,
    this.notes,
  });

  String? type;
  String? name;
  String? usage;
  bool? fixedAmount;
  int? paymentAmount;
  String? description;
  String? customerId;
  int? closeBy;
  QrNotes? notes;

  factory CreateQrCodeModel.fromMap(Map<String, dynamic> json) => CreateQrCodeModel(
    type: json["type"],
    name: json["name"],
    usage: json["usage"],
    fixedAmount: json["fixed_amount"],
    paymentAmount: json["payment_amount"],
    description: json["description"],
    customerId: json["customer_id"],
    closeBy: json["close_by"],
    notes: json["notes"] == null ? null : QrNotes.fromMap(json["notes"]),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "name": name,
    "usage": usage,
    "fixed_amount": fixedAmount,
    "payment_amount": paymentAmount,
    "description": description,
    "customer_id": customerId,
    "close_by": closeBy,
    "notes": notes?.toMap(),
  };
}

class QrNotes {
QrNotes({
    this.purpose,
  });

  String? purpose;

  factory QrNotes.fromMap(Map<String, dynamic> json) => QrNotes(
    purpose: json["purpose"],
  );

  Map<String, dynamic> toMap() => {
    "purpose": purpose,
  };
}
