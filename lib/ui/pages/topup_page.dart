import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/bank_item.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Up')),
      body: ListView(
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
                  Image.asset('assets/img_wallet.png', width: 80, height: 55),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '8008 2208 1996',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Akane Kurokawa',
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
                minutes: '50 mins',
                isSelected: true,
              ),
              BankItem(
                imageUrl: 'assets/img_bni.png',
                name: 'BANK BNI',
                minutes: '50 mins',
              ),
              BankItem(
                imageUrl: 'assets/img_mandiri.png',
                name: 'BANK MANDIRI',
                minutes: '50 mins',
              ),
              BankItem(
                imageUrl: 'assets/img_ocbc.png',
                name: 'BANK OCBC',
                minutes: '50 mins',
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
      ),
    );
  }
}
