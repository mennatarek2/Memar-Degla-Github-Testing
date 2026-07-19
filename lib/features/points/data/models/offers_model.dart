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
    title: "Early Payment Bonus",
    discription:
        "Pay your installments early and earn 2x loyalty points on every payment",
    endDate: "Ends Feb 28",
    offerType: "payment",
    offersBenfits: "2X",
  ),
  OffersModel(
    title: "Referral Double Points",
    discription:
        "Refer a friend and both of you earn double points when they make their first purchase",
    endDate: "Ends Feb 28",
    offerType: "Referral",
    offersBenfits: "2X",
  ),
  OffersModel(
    title: "Ramadan Special Offer",
    discription:
        "Pay your installments early and earn 2x loyalty points on every payment",
    endDate: "Ends Feb 28",
    offerType: "Campagin",
    offersBenfits: "15%",
  ),
];
final List<Colors> backgroundColor = [];
