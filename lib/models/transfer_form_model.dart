class TransferFormModel {
  final String? amount;
  final String? sendTo;
  final String? pin;

  TransferFormModel({this.amount, this.sendTo, this.pin});

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'send_to': sendTo, 'pin': pin};
  }

  TransferFormModel copyWith({String? amount, String? sendTo, String? pin}) {
    return TransferFormModel(
      amount: amount ?? this.amount,
      sendTo: sendTo ?? this.sendTo,
      pin: pin ?? this.pin,
    );
  }
}
