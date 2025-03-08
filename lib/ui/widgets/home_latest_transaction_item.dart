import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String amount;
  const HomeLatestTransactionItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 48),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(date, style: grayTextStyle.copyWith(fontSize: 12)),
              ],
            ),
          ),
          Text(
            amount,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
