import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memar_degla/constants/assets.dart';
import 'package:memar_degla/core/routes/app_routes.dart';
import 'package:memar_degla/core/themes/app_colors.dart';
import 'package:memar_degla/features/onboarding/data/models/onboarding_model.dart';
import 'onboarding_page_item.dart';
import 'page_indicator.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  final PageController _controller = PageController();
  int _current = 0;

  static final int _pageCount = onBoardingModel.length;

  void _goToLogin() {
    GoRouter.of(context).go(AppRoutes.login);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        color: colors.scaffoldBackground,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Skip button at top-left
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: _goToLogin,
                    child: Text(
                      'onboarding.skip'.tr(),
                      style: TextStyle(color: colors.onPrimaryGold),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Logo centered
            Expanded(
              flex: 3,
              child: Center(
                child: Image.asset(
                  Assets.assetsImagesDeglaBlackLogo,
                  fit: BoxFit.contain,
                  height: 120,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // PageView area
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _pageCount,
                      onPageChanged: (i) => setState(() => _current = i),
                      itemBuilder: (context, index) {
                        // Titles/subtitles intentionally left empty for manual entry later
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: OnboardingPageItem(
                            title: onBoardingModel[index].title,
                            subtitle: onBoardingModel[index].subTitle,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Indicator
                  PageIndicator(count: _pageCount, current: _current),

                  const SizedBox(height: 16),

                  // Next / Get started button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 12.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: colors.scaffoldBackground,
                          side: BorderSide(color: colors.onPrimaryGold),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_current < _pageCount - 1) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            _goToLogin();
                          }
                        },
                        child: Text(
                          'onboarding.next'.tr(),
                          style: TextStyle(
                            color: colors.onPrimaryGold,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
