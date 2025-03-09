import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController _pinController = TextEditingController();

  void _onButtonPressed(String value) {
    if (_pinController.text.length < 6) {
      setState(() {
        _pinController.text += value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha PIN',
                style: whiteTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 72),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _pinController,
                  obscureText: true,
                  enabled: false,
                  cursorColor: grayColor,
                  obscuringCharacter: '*',
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 14,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: grayColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 68),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                    title: '1',
                    onTap: () => _onButtonPressed('1'),
                  ),
                  CustomInputButton(
                    title: '2',
                    onTap: () => _onButtonPressed('2'),
                  ),
                  CustomInputButton(
                    title: '3',
                    onTap: () => _onButtonPressed('3'),
                  ),
                  CustomInputButton(
                    title: '4',
                    onTap: () => _onButtonPressed('4'),
                  ),
                  CustomInputButton(
                    title: '5',
                    onTap: () => _onButtonPressed('5'),
                  ),
                  CustomInputButton(
                    title: '6',
                    onTap: () => _onButtonPressed('6'),
                  ),
                  CustomInputButton(
                    title: '7',
                    onTap: () => _onButtonPressed('7'),
                  ),
                  CustomInputButton(
                    title: '8',
                    onTap: () => _onButtonPressed('8'),
                  ),
                  CustomInputButton(
                    title: '9',
                    onTap: () => _onButtonPressed('9'),
                  ),
                  const SizedBox(width: 60, height: 60),
                  CustomInputButton(
                    title: '0',
                    onTap: () => _onButtonPressed('0'),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_pinController.text.isNotEmpty) {
                          _pinController.text = _pinController.text.substring(
                            0,
                            _pinController.text.length - 1,
                          );
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
            ],
          ),
        ),
      ),
    );
  }
}
