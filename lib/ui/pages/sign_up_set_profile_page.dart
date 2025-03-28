import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sha/models/sign_up_form_model.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfilePage({super.key, required this.data});

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo_light.png'),
              ),
            ),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: lightBackgroundColor,
                      shape: BoxShape.circle,
                      image:
                          selectedImage != null
                              ? DecorationImage(
                                image: FileImage(File(selectedImage!.path)),
                                fit: BoxFit.cover,
                              )
                              : null,
                    ),
                    child:
                        selectedImage != null
                            ? null
                            : Center(
                              child: Image.asset(
                                'assets/ic_upload.png',
                                width: 32,
                              ),
                            ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.data.name ?? 'Your Name',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 40),
                CustomFormField(
                  label: 'Set PIN (6 digit number)',
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  controller: pinController,
                ),
                const SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => SignUpSetKtpPage(
                                data: widget.data.copyWith(
                                  pin: pinController.text,
                                  profilePicture:
                                      selectedImage != null
                                          ? 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'
                                          : null,
                                ),
                              ),
                        ),
                      );
                    } else {
                      showCustomSnackBar(context, 'PIN must be 6 digits');
                    }
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
