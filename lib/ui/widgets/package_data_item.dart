import 'package:flutter/material.dart';
import 'package:flutter_sha/models/data_plan_model.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';

class PackageDataItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;
  const PackageDataItem({
    super.key,
    required this.dataPlan,
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
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(fontSize: 32, fontWeight: medium),
          ),
          const SizedBox(height: 6),
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: grayTextStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
