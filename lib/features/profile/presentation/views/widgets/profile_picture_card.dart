import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memar_degla/core/constants/assets.dart';
import 'package:memar_degla/core/services/image_picker_services.dart';
import 'package:memar_degla/core/themes/theme_extention.dart';

import 'package:memar_degla/features/profile/presentation/manger/cubit/profile_picture_cubit.dart';
import 'package:memar_degla/features/profile/presentation/manger/cubit/profile_picture_state.dart';

/// A circular profile picture, meant for the app bar, that:
/// - shows a default image until the user picks one
/// - reads/persists the picked image via [ProfilePictureCubit]
///   (backed by SharedPreferences)
/// - periodically does a slow, coin-toss-style flip
///
/// Assumes a [ProfilePictureCubit] is already available above this
/// widget in the tree (via BlocProvider) — see wiring notes below.
class ProfilePictureCircularCard extends StatefulWidget {
  const ProfilePictureCircularCard({
    super.key,
    this.size = 44,
    this.defaultAssetImage = Assets.assetsImagesDefaultProfile,
    this.enableAutoFlip = true,
  });

  final double size;
  final String defaultAssetImage;
  final bool enableAutoFlip;

  @override
  State<ProfilePictureCircularCard> createState() =>
      _ProfilePictureCircularCardState();
}

class _ProfilePictureCircularCardState extends State<ProfilePictureCircularCard>
    with SingleTickerProviderStateMixin {
  static const Duration _flipInterval = Duration(seconds: 6);
  static const Duration _flipDuration = Duration(milliseconds: 1400);

  final _imagePickerService = ImagePickerService();

  late final AnimationController _flipController;
  Timer? _flipTimer;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(vsync: this, duration: _flipDuration);
    if (widget.enableAutoFlip) {
      _startAutoFlip();
    }
    // Restore whatever was picked in a previous session.
    context.read<ProfilePictureCubit>().loadSavedImage();
  }

  void _startAutoFlip() {
    _flipTimer = Timer.periodic(_flipInterval, (_) {
      if (!mounted) return;
      _flipController.forward(from: 0).then((_) {
        if (mounted) _flipController.reset();
      });
    });
  }

  Future<void> _pickImage() async {
    final file = await _imagePickerService.showImageSourceSheet(context);
    if (file == null || !mounted) return;
    // The widget only obtains the File; the Cubit decides how/where
    // it gets persisted.
    context.read<ProfilePictureCubit>().selectImage(file.path);
  }

  @override
  void dispose() {
    _flipTimer?.cancel();
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: _pickImage,
      child: AnimatedBuilder(
        animation: _flipController,
        builder: (context, child) {
          final angle = _flipController.value * 2 * math.pi;
          final depthScale = 1 - (0.08 * math.sin(angle).abs());

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015)
              ..rotateY(angle)
              ..scale(depthScale),
            child: child,
          );
        },
        child: Container(
          width: widget.size,
          height: widget.size,
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: colors.primaryGold, width: 2),
            boxShadow: [
              BoxShadow(
                color: colors.primaryGold.withValues(alpha: 0.35),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: BlocBuilder<ProfilePictureCubit, ProfilePictureState>(
              builder: (context, state) {
                final file = state.imageFile;
                if (file != null) {
                  return Image.file(
                    file,
                    fit: BoxFit.cover,
                    width: widget.size,
                    height: widget.size,
                    // If the saved path pointed at a file that's been
                    // deleted/moved since, fall back gracefully instead
                    // of showing Flutter's broken-image icon.
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        widget.defaultAssetImage,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }
                return Image.asset(
                  widget.defaultAssetImage,
                  fit: BoxFit.cover,
                  width: widget.size,
                  height: widget.size,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
