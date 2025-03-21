import 'package:flutter/material.dart';
import 'package:flutter_sha/models/topup_form_model.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  final TopupFormModel data;
  const TopupAmountPage({super.key, required this.data});

  @override
  _TopupAmountPageState createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController _amountController = TextEditingController(
    text: '0',
  );

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() {
      final text = _amountController.text.replaceAll(',', '');
      if (text.isNotEmpty && int.tryParse(text) != null) {
        _amountController.value = _amountController.value.copyWith(
          text: NumberFormat('#,###').format(int.parse(text)),
        );
      }
    });
  }

  void _onButtonPressed(String value) {
    if (_amountController.text == '0') {
      _amountController.text = '';
    }
    setState(() {
      _amountController.text += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        children: [
          const SizedBox(height: 40),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(height: 67),
          Align(
            child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: _amountController,
                enabled: false,
                cursorColor: grayColor,
                style: whiteTextStyle.copyWith(
                  fontSize: 36,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  prefixIcon: Text(
                    'Rp',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: grayColor),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 68),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              CustomInputButton(title: '1', onTap: () => _onButtonPressed('1')),
              CustomInputButton(title: '2', onTap: () => _onButtonPressed('2')),
              CustomInputButton(title: '3', onTap: () => _onButtonPressed('3')),
              CustomInputButton(title: '4', onTap: () => _onButtonPressed('4')),
              CustomInputButton(title: '5', onTap: () => _onButtonPressed('5')),
              CustomInputButton(title: '6', onTap: () => _onButtonPressed('6')),
              CustomInputButton(title: '7', onTap: () => _onButtonPressed('7')),
              CustomInputButton(title: '8', onTap: () => _onButtonPressed('8')),
              CustomInputButton(title: '9', onTap: () => _onButtonPressed('9')),
              const SizedBox(width: 60, height: 60),
              CustomInputButton(title: '0', onTap: () => _onButtonPressed('0')),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_amountController.text.isNotEmpty) {
                      _amountController.text = _amountController.text.substring(
                        0,
                        _amountController.text.length - 1,
                      );
                    }

                    if (_amountController.text.isEmpty) {
                      _amountController.text = '0';
                    }
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: numberBackgroundColor,
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back, color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          CustomFilledButton(
            title: 'Checkout Now',
            onPressed: () async {
              final result = await Navigator.pushNamed(context, '/pin');
              if (result == true) {
                final url = Uri.parse('https://demo.midtrans.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/topup-success',
                    (route) => false,
                  );
                }
              }
            },
          ),
          const SizedBox(height: 25),
          CustomTexButton(title: 'Terms & Conditions', onPressed: () {}),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
