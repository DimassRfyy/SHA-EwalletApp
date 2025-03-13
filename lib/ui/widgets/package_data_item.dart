import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';

class PackageDataItem extends StatelessWidget {
  final int quota;
  final int price;
  final bool isSelected;
  const PackageDataItem({
    super.key,
    required this.quota,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 175,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$quota GB',
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
          ),
          const SizedBox(height: 6),
          Text(
            formatCurrency(price),
            style: grayTextStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
