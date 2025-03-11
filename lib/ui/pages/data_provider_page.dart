import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/bank_item.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buy Data')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From Wallet',
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
                        'Balance: Rp 180.000.000',
                        style: grayTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'Select Provider',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 14),
              BankItem(
                imageUrl: 'assets/img_telkomsel.png',
                name: 'Telkomsel',
                description: 'Available',
                isSelected: true,
              ),
              BankItem(
                imageUrl: 'assets/img_indosat.png',
                name: 'Indosat',
                description: 'Available',
              ),
              BankItem(
                imageUrl: 'assets/img_singtel.png',
                name: 'Singtel',
                description: 'Available',
              ),
              const SizedBox(height: 20),
              CustomFilledButton(title: 'Continue', onPressed: () {
                Navigator.pushNamed(context, '/data-package');
              }),
              const SizedBox(height: 55),
            ],
          ),
        ],
      ),
    );
  }
}
