import 'package:flutter/material.dart';
import 'package:flutter_sha/models/operator_card_model.dart';
import 'package:flutter_sha/shared/theme.dart';

class DataProviderItem extends StatelessWidget {
  final OperatorCardModel operatorCard;
  final bool isSelected;
  const DataProviderItem({
    super.key,
    this.isSelected = false,
    required this.operatorCard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(operatorCard.thumbnail.toString(), height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operatorCard.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                operatorCard.status.toString(),
                style: grayTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
