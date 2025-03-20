import 'package:flutter/material.dart';
import 'package:flutter_sha/models/payment_method_model.dart';
import 'package:flutter_sha/shared/theme.dart';

class BankItem extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  final String description;
  final bool isSelected;

  const BankItem({
    super.key,
    required this.paymentMethod,
    required this.description,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : Colors.transparent,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(23),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(paymentMethod.thumbnail.toString(), height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethod.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(description, style: grayTextStyle.copyWith(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
