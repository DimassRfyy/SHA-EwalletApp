import 'package:flutter/material.dart';
import 'package:flutter_sha/models/user_model.dart';
import 'package:flutter_sha/shared/theme.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;
  const TransferRecentUserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    user.profilePicture != null
                        ? NetworkImage(user.profilePicture!)
                        : const AssetImage('assets/img_profile.png')
                            as ImageProvider,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '@${user.username!}',
                style: grayTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(Icons.check_circle, color: greenColor, size: 14),
                const SizedBox(width: 4),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
