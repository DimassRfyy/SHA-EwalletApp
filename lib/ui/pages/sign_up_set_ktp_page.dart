import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sha/blocs/auth/auth_bloc.dart';
import 'package:flutter_sha/models/sign_up_form_model.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetKtpPage({super.key, required this.data});

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
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
                'Verify Your\nAccount',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
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
                      'Passport / KTP',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                            AuthRegister(
                              widget.data.copyWith(
                                ktp:
                                    selectedImage != null
                                        ? 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'
                                        : null,
                              ),
                            ),
                          );
                        } else {
                          showCustomSnackBar(context, 'Please upload your KTP');
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              CustomTexButton(
                title: 'Skip for Now',
                onPressed: () {
                  context.read<AuthBloc>().add(
                    AuthRegister(widget.data.copyWith(ktp: widget.data.ktp)),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
