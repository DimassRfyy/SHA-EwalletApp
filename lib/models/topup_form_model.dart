class TopupFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  TopupFormModel({this.amount, this.pin, this.paymentMethodCode});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'pin': pin,
      'payment_method_code': paymentMethodCode,
    };
  }

  TopupFormModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) {
    return TopupFormModel(
      amount: amount ?? this.amount,
      pin: pin ?? this.pin,
      paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
    );
  }
}
