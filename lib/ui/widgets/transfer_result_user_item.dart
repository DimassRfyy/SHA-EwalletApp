import 'package:flutter/material.dart';
import 'package:flutter_sha/models/user_model.dart';
import 'package:flutter_sha/shared/theme.dart';

class TransferResultUserItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  const TransferResultUserItem({
    super.key,
    required this.user,
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
        children: [
          Container(
            width: 70,
            height: 70,
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
            child:
                user.verified == 1
                    ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 16,
                          ),
                        ),
                      ),
                    )
                    : null,
          ),
          const SizedBox(height: 13),
          Text(
            user.name.toString(),
            style: blackTextStyle.copyWith(fontSize: 15, fontWeight: medium),
          ),
          const SizedBox(height: 2),
          Text(
            '@${user.username}',
            style: grayTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
