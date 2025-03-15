import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowLabel;
  final TextInputType? keyboardType;

  const CustomFormField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
    this.isShowLabel = true,
    this.keyboardType,
  });

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowLabel)
          Text(
            widget.label,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          ),
        if (widget.isShowLabel) const SizedBox(height: 8),
        TextFormField(
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: !widget.isShowLabel ? widget.label : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            contentPadding: const EdgeInsets.all(12),
            suffixIcon:
                widget.obscureText
                    ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
