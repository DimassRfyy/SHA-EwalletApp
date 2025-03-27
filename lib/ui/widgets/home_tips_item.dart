import 'package:flutter/material.dart';
import 'package:flutter_sha/models/tips_model.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final TipsModel tips;
  const HomeTipsItem({super.key, required this.tips});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final urlUri = Uri.parse(tips.url.toString());
        if (await canLaunchUrl(urlUri)) {
          await launchUrl(urlUri);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('URL is not available')));
          }
        }
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child:
                  tips.thumbnail != null
                      ? Image.network(
                        tips.thumbnail.toString(),
                        width: double.infinity,
                        height: 110,
                        fit: BoxFit.cover,
                      )
                      : Image.asset(
                        'assets/img_tips1.png',
                        width: double.infinity,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                tips.title.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
