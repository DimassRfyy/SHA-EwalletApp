import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';

class HomeTipsItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String url;
  const HomeTipsItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 176,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              title,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
