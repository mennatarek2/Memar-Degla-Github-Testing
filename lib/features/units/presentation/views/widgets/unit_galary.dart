import 'package:flutter/material.dart';
import 'package:memar_degla/core/styles/text_styles.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';
import 'package:memar_degla/features/units/domain/entities/unit_entity.dart';
import 'package:memar_degla/features/units/presentation/widgets/unit_status_badge.dart';

class UnitGalleryStack extends StatefulWidget {
  final List<String> imageUrls;
  final String unitType;
  final String unitCode;
  final UnitStatus unitStatus;
  final VoidCallback? onBackTap;
  final void Function(List<String> images, int index)? onOpenFullGallery;

  const UnitGalleryStack({
    super.key,
    required this.imageUrls,
    required this.unitType,
    required this.unitStatus,
    this.onBackTap,
    this.onOpenFullGallery,
    required this.unitCode,
  });

  @override
  State<UnitGalleryStack> createState() => _UnitGalleryStackState();
}

class _UnitGalleryStackState extends State<UnitGalleryStack> {
  late int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.imageUrls;
    final otherIndexes = [
      for (int i = 0; i < images.length; i++)
        if (i != _activeIndex) i,
    ];

    final visibleThumbIndexes = otherIndexes.take(2).toList();
    final remainingCount = otherIndexes.length - visibleThumbIndexes.length;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Hero image
            Image.asset(images[_activeIndex], fit: BoxFit.cover),

            // Top bar: back button only
            Positioned(
              top: 40,
              left: 16,
              child: _CircleIconButton(
                icon: Icons.chevron_left,
                onTap: widget.onBackTap ?? () => Navigator.maybePop(context),
              ),
            ),
            Positioned(
              top: 40,
              right: 16,
              child: UnitStatusBadge(status: widget.unitStatus),
            ),
            // Thumbnail stack, right side
            if (images.length > 1)
              Positioned(
                right: 12,
                bottom: 40,
                child: Column(
                  children: [
                    for (final i in visibleThumbIndexes) ...[
                      _Thumbnail(
                        imageUrl: images[i],
                        onTap: () => setState(() => _activeIndex = i),
                      ),
                      const SizedBox(height: 8),
                    ],
                    if (remainingCount > 0)
                      _MoreCountThumbnail(
                        count: remainingCount,
                        imageUrl:
                            images[otherIndexes[visibleThumbIndexes.length]],
                        onTap: () {
                          if (widget.onOpenFullGallery != null) {
                            widget.onOpenFullGallery!(images, _activeIndex);
                          }
                        },
                      ),
                  ],
                ),
              ),

            // Bottom badge: category only
            Positioned(
              left: 16,
              bottom: 16,
              child: _InfoBadge(unitType: widget.unitType),
            ),
            Positioned(
              left: 16,
              bottom: 64,
              child: _CodeBadge(unitCode: widget.unitCode),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: context.colors.iconBackGround,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: context.colors.icon, size: 20),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const _Thumbnail({required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class _MoreCountThumbnail extends StatelessWidget {
  final int count;
  final String imageUrl;
  final VoidCallback onTap;

  const _MoreCountThumbnail({
    required this.count,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(imageUrl, fit: BoxFit.cover),
              Container(
                color: Colors.black.withValues(alpha: 0.55),
                alignment: Alignment.center,
                child: Text(
                  '+$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final String unitType;

  const _InfoBadge({required this.unitType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        unitType,
        style: AppStyles.styleBold16(
          context,
        ).copyWith(color: context.colors.iconBackGround),
      ),
    );
  }
}

class _CodeBadge extends StatelessWidget {
  final String unitCode;

  const _CodeBadge({required this.unitCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        unitCode,
        style: AppStyles.styleBold16(
          context,
        ).copyWith(color: context.colors.iconBackGround),
      ),
    );
  }
}
