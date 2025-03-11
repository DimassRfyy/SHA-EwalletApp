import 'package:flutter/material.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';
import 'package:flutter_sha/ui/widgets/package_data_item.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Package')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 40),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          CustomFormField(label: '+62', isShowLabel: false),
          const SizedBox(height: 40),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 25,
            runSpacing: 17,
            children: [
              PackageDataItem(quota: 20, price: 20000, isSelected: true),
              PackageDataItem(quota: 20, price: 20000),
              PackageDataItem(quota: 20, price: 20000),
            ],
          ),
          const SizedBox(height: 100),
          CustomFilledButton(title: 'Buy Package', onPressed: () {}),
        ],
      ),
    );
  }
}
