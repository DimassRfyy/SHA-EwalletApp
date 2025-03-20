import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sha/blocs/auth/auth_bloc.dart';
import 'package:flutter_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:flutter_sha/models/payment_method_model.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/bank_item.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;
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
                    BlocProvider(
                      create:
                          (context) =>
                              PaymentMethodBloc()..add(FetchPaymentMethod()),
                      child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                        builder: (context, state) {
                          if (state is PaymentMethodSuccess) {
                            return Column(
                              children:
                                  state.paymentMethods
                                      .map(
                                        (e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedPaymentMethod = e;
                                            });
                                          },
                                          child: BankItem(
                                            paymentMethod: e,
                                            description: 'Transfer',
                                            isSelected:
                                                e.id ==
                                                selectedPaymentMethod?.id,
                                          ),
                                        ),
                                      )
                                      .toList(),
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (selectedPaymentMethod != null)
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
