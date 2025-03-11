import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';

class BankItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final bool isSelected;

  const BankItem({
    super.key,
    required this.imageUrl,
    required this.name,
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
          Image.asset(imageUrl, height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
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
