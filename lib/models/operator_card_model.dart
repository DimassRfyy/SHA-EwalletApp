import 'package:flutter_sha/models/data_plan_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  OperatorCardModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlans,
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) {
    return OperatorCardModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      thumbnail: json['thumbnail'],
      dataPlans: json['data_plans'] != null
          ? (json['data_plans'] as List)
              .map((dataPlan) => DataPlanModel.fromJson(dataPlan))
              .toList()
          : null,
          
    );
  }
}
