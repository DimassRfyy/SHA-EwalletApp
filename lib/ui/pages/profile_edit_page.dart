import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 45),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomFormField(label: 'Username'),
                const SizedBox(height: 16),
                const CustomFormField(label: 'Full Name'),
                const SizedBox(height: 16),
                const CustomFormField(label: 'Email Address'),
                const SizedBox(height: 16),
                const CustomFormField(label: 'Password', obscureText: true),
                const SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-set-profile');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
