import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 23),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Akane Kurokawa',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 40),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_edit_profile.png',
                  title: 'Edit Profile',
                  onTap: () {
                    Navigator.pushNamed(context, '/pin');
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_pin.png',
                  title: 'My PIN',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_wallet_setting.png',
                  title: 'Wallet Setting',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_my_reward.png',
                  title: 'My Rewards',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_help_center.png',
                  title: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ic_logout.png',
                  title: 'Log Out',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 90),
          CustomTexButton(title: 'Report a Problem', onPressed: () {}),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
