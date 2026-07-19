import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/offers_gradients.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/points/data/models/offers_model.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/offers_card.dart';

class OffersScreenBody extends StatelessWidget {
  const OffersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: offers.length,

      itemBuilder: ((context, index) {
        final offerdetails = offers[index];
        final colors = context.colors;
        final brightness = Theme.of(context).brightness;
        final List<LinearGradient> gradients = [
          OfferGradients.earlyPaymentBonus(colors, brightness),
          OfferGradients.referralDoublePoints(colors, brightness),
          OfferGradients.ramadanSpecialOffer(colors, brightness),
        ];
        return OffersCard(
          gradient: gradients[index],
          icon: Icons.payments_outlined,
          offersBenfits: offerdetails.offersBenfits,
          offerType: offerdetails.offerType,
          title: offerdetails.title,
          subtitle: offerdetails.discription,
          endDate: offerdetails.endDate,
        );
      }),
    );
  }
}
