import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sha/blocs/auth/auth_bloc.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/bank_item.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Up')),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wallet',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/img_wallet.png',
                          width: 80,
                          height: 55,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.user.cardNumber!.replaceAllMapped(
                                RegExp(r".{1,4}"),
                                (match) => "${match.group(0)} ",
                              ),
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              state.user.name!,
                              style: grayTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Select Bank',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    BankItem(
                      imageUrl: 'assets/img_bca.png',
                      name: 'BANK BCA',
                      description: '50 mins',
                      isSelected: true,
                    ),
                    BankItem(
                      imageUrl: 'assets/img_bni.png',
                      name: 'BANK BNI',
                      description: '50 mins',
                    ),
                    BankItem(
                      imageUrl: 'assets/img_mandiri.png',
                      name: 'BANK MANDIRI',
                      description: '50 mins',
                    ),
                    BankItem(
                      imageUrl: 'assets/img_ocbc.png',
                      name: 'BANK OCBC',
                      description: '50 mins',
                    ),
                    const SizedBox(height: 20),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(context, '/topup-amount');
                      },
                    ),
                    const SizedBox(height: 55),
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
