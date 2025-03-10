import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';

class HomeServiceItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  const HomeServiceItem({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Center(child: Image.asset(imageUrl, width: 26)),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
