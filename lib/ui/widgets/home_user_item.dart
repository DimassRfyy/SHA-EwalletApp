import 'package:flutter/material.dart';
import 'package:flutter_sha/models/user_model.dart';
import 'package:flutter_sha/shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;
  const HomeUserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 17),
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 13),
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
