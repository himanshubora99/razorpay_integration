class QRCodeResponse {
  String? id;
  String? entity;
  int? createdAt;
  String? name;
  String? usage;
  String? type;
  String? imageUrl;
  double? paymentAmount;
  String? status;
  String? description;
  bool? fixedAmount;
  double? paymentsAmountReceived;
  int? paymentsCountReceived;
  String? customerId;
  int? closeBy;
  int? closedAt;
  String? closeReason;

  QRCodeResponse(
      {this.id,
        this.entity,
        this.createdAt,
        this.name,
        this.usage,
        this.type,
        this.imageUrl,
        this.paymentAmount,
        this.status,
        this.description,
        this.fixedAmount,
        this.paymentsAmountReceived,
        this.paymentsCountReceived,
        this.customerId,
        this.closeBy,
        this.closedAt,
        this.closeReason});

  QRCodeResponse.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    entity = json['entity'];
    createdAt = json['created_at'];
    name = json['name'];
    usage = json['usage'];
    type = json['type'];
    imageUrl = json['image_url'];
    paymentAmount = json['payment_amount'] == null
        ? 0.0
        : json['payment_amount'].toDouble();
    status = json['status'];
    description = json['description'];
    fixedAmount = json['fixed_amount'];
    paymentsAmountReceived = json['payments_amount_received'] == null
        ? 0.0
        : json['payments_amount_received'].toDouble();
    paymentsCountReceived = json['payments_count_received'];
    customerId = json['customer_id'];
    closeBy = json['close_by'];
    closedAt = json['closed_at'];
    closeReason = json['close_reason'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['entity'] = entity;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['usage'] = usage;
    data['type'] = type;
    data['image_url'] = imageUrl;
    data['payment_amount'] = paymentAmount;
    data['status'] = status;
    data['description'] = description;
    data['fixed_amount'] = fixedAmount;
    data['payments_amount_received'] = paymentsAmountReceived;
    data['payments_count_received'] = paymentsCountReceived;
    data['customer_id'] = customerId;
    data['close_by'] = closeBy;
    data['closed_at'] = closedAt;
    data['close_reason'] = closeReason;
    return data;
  }
}

