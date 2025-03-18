import 'package:flutter/material.dart';
import 'package:flutter_sha/blocs/auth/auth_bloc.dart';
import 'package:flutter_sha/models/user_edit_form_model.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final fullNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (usernameController.text.isEmpty ||
        fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      fullNameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: BlocConsumer<AuthBloc, AuthState>(
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
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
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
                      label: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      label: 'Full Name',
                      controller: fullNameController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      label: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomFormField(
                      label: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 30),
                    CustomFilledButton(
                      title: 'Update Profile',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                            AuthUpdateUser(
                              UserEditFormModel(
                                username: usernameController.text,
                                name: fullNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                        } else {
                          showCustomSnackBar(context, 'Please fill all fields');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
