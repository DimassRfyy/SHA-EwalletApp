import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sha/blocs/auth/auth_bloc.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  final confirmPinController = TextEditingController(text: '');

  String? validate() {
    if (oldPinController.text.isEmpty ||
        newPinController.text.isEmpty ||
        confirmPinController.text.isEmpty) {
      return 'All fields must be filled';
    }
    if (newPinController.text.length != 6) {
      return 'New PIN must be 6 digits';
    }
    if (oldPinController.text == newPinController.text) {
      return 'New PIN cannot be the same as Old PIN';
    }
    if (newPinController.text != confirmPinController.text) {
      return 'New PIN and Confirm PIN do not match';
    }
    return null; // Validasi berhasil
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      oldPinController.text = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackBar(context, state.e);
        }
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/profile-edit-success',
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text('Edit PIN')),
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
                    CustomFormField(
                      label: 'Old PIN',
                      controller: oldPinController,
                      obscureText: true,
                      readOnly: true,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      label: 'New PIN',
                      controller: newPinController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      maxLength: 6,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      label: 'Confirm New PIN',
                      controller: confirmPinController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      maxLength: 6,
                    ),
                    const SizedBox(height: 30),
                    CustomFilledButton(
                      title: 'Update PIN',
                      onPressed: () {
                        final errorMessage = validate();
                        if (errorMessage != null) {
                          showCustomSnackBar(context, errorMessage);
                        } else {
                          context.read<AuthBloc>().add(
                            AuthUpdatePin(
                              oldPinController.text,
                              newPinController.text,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
