import 'package:flutter/material.dart';
import 'package:flutter_sha/models/data_plan_model.dart';
import 'package:flutter_sha/models/operator_card_model.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:flutter_sha/ui/widgets/buttons.dart';
import 'package:flutter_sha/ui/widgets/forms.dart';
import 'package:flutter_sha/ui/widgets/package_data_item.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel data;
  const DataPackagePage({super.key, required this.data});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;
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
          CustomFormField(
            label: '+62',
            isShowLabel: false,
            controller: phoneController,
          ),
          const SizedBox(height: 40),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 25,
            runSpacing: 17,
            children:
                widget.data.dataPlans!
                    .map(
                      (dataPlan) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDataPlan = dataPlan;
                          });
                        },
                        child: PackageDataItem(
                          dataPlan: dataPlan,
                          isSelected: selectedDataPlan?.id == dataPlan.id,
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 30),
        ],
      ),
      floatingActionButton:
          (selectedDataPlan != null && phoneController.text.isNotEmpty)
              ? Container(
                margin: const EdgeInsets.all(24),
                child: CustomFilledButton(title: 'Continue', onPressed: () {}),
              )
              : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
