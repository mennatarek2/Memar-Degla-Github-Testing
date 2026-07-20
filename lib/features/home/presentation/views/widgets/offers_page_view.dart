import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memar_degla/core/styles/offers_gradients.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/points/data/models/offers_model.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/offers_card.dart';

class OffersCardsPageView extends StatefulWidget {
  const OffersCardsPageView({super.key});

  @override
  State<OffersCardsPageView> createState() => _OffersCardsPageViewState();
}

class _OffersCardsPageViewState extends State<OffersCardsPageView> {
  // Multiplying the real item count creates an always-forward loop instead
  // of snapping backward from the last card to the first.
  static const int _loopMultiplier = 1000;

  // How long a card sits fully visible before the next slide starts.
  static const Duration _readDuration = Duration(seconds: 4);

  // How long the slide itself takes. This is the "disappearing" speed —
  // longer duration = the outgoing card lingers and fades out of view slower.
  static const Duration _transitionDuration = Duration(milliseconds: 1500);

  late final PageController _pageController;
  Timer? _autoScrollTimer;
  int _currentPage = 0;
  bool _userInteracting = false;

  int get _realCount => offers.length;

  @override
  void initState() {
    super.initState();
    _currentPage = (_loopMultiplier ~/ 2) * _realCount;
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(_readDuration, (_) {
      if (!_pageController.hasClients || _userInteracting) return;
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: _transitionDuration,
        curve: Curves.easeInOutSine,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final brightness = Theme.of(context).brightness;
    final List<LinearGradient> gradients = [
      OfferGradients.earlyPaymentBonus(colors, brightness),
      OfferGradients.referralDoublePoints(colors, brightness),
      OfferGradients.ramadanSpecialOffer(colors, brightness),
    ];

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is UserScrollNotification) {
          _userInteracting = notification.direction != ScrollDirection.idle;
        }
        return false;
      },
      child: PageView.builder(
        controller: _pageController,
        itemCount: _realCount * _loopMultiplier,
        onPageChanged: (index) => _currentPage = index,
        itemBuilder: (context, index) {
          final realIndex = index % _realCount;
          final offerdetails = offers[realIndex];
          return OffersCard(
            gradient: gradients[realIndex % gradients.length],
            icon: Icons.payments_outlined,
            offersBenfits: offerdetails.offersBenfits,
            offerType: offerdetails.offerType,
            title: offerdetails.title,
            subtitle: offerdetails.discription,
            endDate: offerdetails.endDate,
          );
        },
      ),
    );
  }
}
