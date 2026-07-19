import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/points/data/models/offers_model.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/offers_card.dart';

class OffersScreenBody extends StatelessWidget {
  const OffersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: offers.length,

      itemBuilder: ((context, index) {
        final offerdetails = offers[index];
        final backgroundColor = [
          context.colors.offerNavy,
          context.colors.offerOrange,
          context.colors.offerGreen,
        ];
        final color = backgroundColor[index];
        return OffersCard(
          backgroundColor: color,
          icon: Icons.flash_on_outlined,
          offersBenfits: offerdetails.offersBenfits,
          offerType: offerdetails.offerType,
          title: offerdetails.title,
          endDate: offerdetails.endDate,
          subtitle: offerdetails.discription,
        );
      }),
    );
  }
}
