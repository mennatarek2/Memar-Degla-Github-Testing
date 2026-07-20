import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memar_degla/core/styles/offers_gradients.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/points/data/models/offers_model.dart';
import 'package:memar_degla/features/points/presentation/views/widgets/offers_card.dart';

class OffersCardsPageView extends StatefulWidget {
  const OffersCardsPageView({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  State<OffersCardsPageView> createState() => _OffersCardsPageViewState();
}

class _OffersCardsPageViewState extends State<OffersCardsPageView> {
  // Large enough that scroll offset never realistically reaches the end —
  // avoids ever needing a jumpTo(0) seam.
  static const int _loopMultiplier = 5000;

  // Width of each card. Needs to be explicit (not Expanded/Flexible) since
  // this is a horizontal ListView, not a Row/Column.
  static const double _cardWidth = 300;
  static const double _cardGap = 30;

  // Pixels advanced per tick — this is the crawl speed. Tune this, not a
  // duration, since there's no discrete "transition" anymore.
  static const double _pixelsPerTick = 0.6;
  static const Duration _tickInterval = Duration(milliseconds: 10); // ~60fps

  late final ScrollController _scrollController;
  Timer? _autoScrollTimer;
  bool _userInteracting = false;

  int get _realCount => offers.length;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(_tickInterval, (_) {
      if (!_scrollController.hasClients || _userInteracting) return;

      final position = _scrollController.position;
      if (!position.hasContentDimensions) return;

      final next = position.pixels + _pixelsPerTick;
      // Guard against the (extremely unlikely) case of reaching the end —
      // still cheaper than crashing if someone shrinks _loopMultiplier later.
      if (next < position.maxScrollExtent) {
        _scrollController.jumpTo(next);
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
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
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _realCount * _loopMultiplier,
        itemBuilder: (context, index) {
          final realIndex = index % _realCount;
          final offerdetails = offers[realIndex];
          return Padding(
            padding: EdgeInsets.only(right: _cardGap, left: index == 0 ? 0 : 0),
            child: SizedBox(
              width: _cardWidth,
              child: GestureDetector(
                onTap: widget.onTap,
                child: OffersCard(
                  gradient: gradients[realIndex % gradients.length],
                  icon: Icons.payments_outlined,
                  offersBenfits: offerdetails.offersBenfits,
                  offerType: offerdetails.offerType,
                  title: offerdetails.title,
                  subtitle: offerdetails.discription,
                  endDate: offerdetails.endDate,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
