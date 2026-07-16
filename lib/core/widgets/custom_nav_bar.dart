import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/themes/app_theme.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

class CustomizedNavigationBar extends StatelessWidget {
  const CustomizedNavigationBar({super.key});

  static const double _barHeight = 72;
  static const double _centerButtonSize = 56;

  static final _sideItems = <_NavItem>[
    _NavItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      labelKey: "nav.home".tr(),
      route: AppRoutes.home,
    ),
    _NavItem(
      icon: Icons.local_fire_department_outlined,
      selectedIcon: Icons.local_fire_department_rounded,
      labelKey: "nav.offers".tr(),
      route: AppRoutes.offers,
    ),
    _NavItem(
      icon: Icons.account_balance_wallet_outlined,
      selectedIcon: Icons.account_balance_wallet_rounded,
      labelKey: "nav.wallet".tr(),
      route: AppRoutes.wallet,
    ),
    _NavItem(
      icon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
      labelKey: "nav.units".tr(),
      route: AppRoutes.units,
    ),
  ];

  static const _centerItem = _NavItem(
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
    labelKey: "nav_profile",
    route: AppRoutes.profile,
  );

  int _currentSideIndex(String location) =>
      _sideItems.indexWhere((item) => location.startsWith(item.route));

  bool _isCenterSelected(String location) =>
      location.startsWith(_centerItem.route);

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentSideIndex = _currentSideIndex(location);
    final centerSelected = _isCenterSelected(location);

    final mutedColor = AppTheme.colors(context).textSecondary;
    final goldColor = AppTheme.colors(context).navActive;
    final cardColor = AppTheme.colors(context).navBarBackground;

    return SizedBox(
      height: _barHeight + _centerButtonSize / 2,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: _barHeight,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  _buildSideItem(
                    context,
                    _sideItems[0],
                    currentSideIndex == 0,
                    mutedColor,
                    goldColor,
                  ),
                  _buildSideItem(
                    context,
                    _sideItems[1],
                    currentSideIndex == 1,
                    mutedColor,
                    goldColor,
                  ),
                  const SizedBox(width: _centerButtonSize),
                  _buildSideItem(
                    context,
                    _sideItems[2],
                    currentSideIndex == 2,
                    mutedColor,
                    goldColor,
                  ),
                  _buildSideItem(
                    context,
                    _sideItems[3],
                    currentSideIndex == 3,
                    mutedColor,
                    goldColor,
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (!centerSelected) context.go(_centerItem.route);
              },
              child: _CenterNavButton(
                selected: centerSelected,
                icon: centerSelected
                    ? _centerItem.selectedIcon
                    : _centerItem.icon,
                goldColor: goldColor,
                mutedColor: mutedColor,
                cardColor: cardColor,
                size: _centerButtonSize,
                haloColor: context.colors.iconBackGround,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideItem(
    BuildContext context,
    _NavItem item,
    bool selected,
    Color mutedColor,
    Color goldColor,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!selected) context.go(item.route);
        },
        behavior: HitTestBehavior.opaque,
        child: _NavItemContent(
          item: item,
          selected: selected,
          mutedColor: mutedColor,
          goldColor: goldColor,
        ),
      ),
    );
  }
}

/// Stateful only to track press-down state for the tap-bounce feedback.
/// Selection animation itself is still driven implicitly by [selected] changing.
class _NavItemContent extends StatefulWidget {
  final _NavItem item;
  final bool selected;
  final Color mutedColor;
  final Color goldColor;

  const _NavItemContent({
    required this.item,
    required this.selected,
    required this.mutedColor,
    required this.goldColor,
  });

  @override
  State<_NavItemContent> createState() => _NavItemContentState();
}

class _NavItemContentState extends State<_NavItemContent> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;
    final goldColor = widget.goldColor;
    final mutedColor = widget.mutedColor;

    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed ? 0.88 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: selected ? 1 : 0),
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutBack, // slight overshoot = the "pop" feel
              builder: (context, t, _) {
                final size = 34 + (10 * t);
                return Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.lerp(
                          Colors.transparent,
                          goldColor.withValues(alpha: 0.9),
                          t,
                        )!,
                        Color.lerp(Colors.transparent, goldColor, t)!,
                      ],
                    ),
                    boxShadow: t == 0
                        ? const []
                        : [
                            BoxShadow(
                              color: goldColor.withValues(alpha: 0.35 * t),
                              blurRadius: 10 * t,
                              offset: Offset(0, 4 * t),
                            ),
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.45 * t),
                              blurRadius: 4,
                              offset: const Offset(-1, -1),
                            ),
                          ],
                  ),
                  child: Center(
                    child: Icon(
                      selected ? widget.item.selectedIcon : widget.item.icon,
                      size: 20 + (4 * t),
                      color: Color.lerp(mutedColor, Colors.white, t),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 250),
              style: TextStyle(
                color: selected ? goldColor : mutedColor,
                fontSize: selected ? 11.5 : 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
              child: Text(widget.item.labelKey.tr()),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterNavButton extends StatefulWidget {
  final bool selected;
  final IconData icon;
  final Color goldColor;
  final Color mutedColor;
  final Color cardColor;
  final Color haloColor; // NEW — page/scaffold background, not the bar color
  final double size;

  const _CenterNavButton({
    required this.selected,
    required this.icon,
    required this.goldColor,
    required this.mutedColor,
    required this.cardColor,
    required this.haloColor,
    required this.size,
  });

  @override
  State<_CenterNavButton> createState() => _CenterNavButtonState();
}

class _CenterNavButtonState extends State<_CenterNavButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;

    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      child: AnimatedScale(
        scale: _pressed ? 0.9 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        // The halo ring sits UNDER the button, slightly larger, painted
        // in the page background color. This is what actually reads as
        // "the bar has a hole cut for the button" instead of the button
        // just sitting flush on top of the bar in the overlap zone.
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.haloColor,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutBack,
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? null : widget.cardColor,
              gradient: selected
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.goldColor.withValues(alpha: 0.95),
                        widget.goldColor,
                      ],
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: selected
                      ? widget.goldColor.withValues(alpha: 0.4)
                      : Colors.black.withValues(alpha: 0.08),
                  blurRadius: selected ? 14 : 10,
                  offset: const Offset(0, 4),
                ),
                if (selected)
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.4),
                    blurRadius: 4,
                    offset: const Offset(-1, -1),
                  ),
              ],
            ),
            child: Icon(
              widget.icon,
              color: selected ? Colors.white : widget.mutedColor,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData selectedIcon;
  final String labelKey;
  final String route;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.labelKey,
    required this.route,
  });
}
