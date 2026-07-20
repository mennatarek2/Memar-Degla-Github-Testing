import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OffersModel {
  final String title, discription;
  final String endDate;
  final String offerType;
  final String offersBenfits;

  OffersModel({
    required this.title,
    required this.discription,
    required this.endDate,
    required this.offerType,
    required this.offersBenfits,
  });
}

final List<OffersModel> offers = [
  OffersModel(
    title: 'points.early_payment_bonus'.tr(),
    discription: 'points.early_payment_bonus_desc'.tr(),
    endDate: 'points.ends_feb_28'.tr(),
    offerType: 'points.payment'.tr(),
    offersBenfits: "2X",
  ),
  OffersModel(
    title: 'points.referral_double_points'.tr(),
    discription: 'points.referral_double_points_desc'.tr(),
    endDate: 'points.ends_feb_28'.tr(),
    offerType: 'points.referral'.tr(),
    offersBenfits: "2X",
  ),
  OffersModel(
    title: 'points.ramadan_special_offer'.tr(),
    discription: 'points.early_payment_bonus_desc'.tr(),
    endDate: 'points.ends_feb_28'.tr(),
    offerType: 'points.campaign'.tr(),
    offersBenfits: "15%",
  ),
];
final List<Colors> backgroundColor = [];
