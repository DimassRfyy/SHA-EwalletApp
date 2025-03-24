import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sha/blocs/auth/auth_bloc.dart';
import 'package:flutter_sha/ui/widgets/data_provider_item.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buy Data')),
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
                      'From Wallet',
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
                      'Select Provider',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 14),
                    DataProviderItem(isSelected: true),
                    DataProviderItem(),
                    DataProviderItem(),
                    const SizedBox(height: 20),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(context, '/data-package');
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
