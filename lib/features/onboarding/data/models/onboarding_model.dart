import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  final String title, subTitle;

  OnboardingModel({required this.title, required this.subTitle});
}

final List<OnboardingModel> onBoardingModel = [
  OnboardingModel(
    title: 'onboarding.title1'.tr(),
    subTitle: 'onboarding.subtitle1'.tr(),
  ),
  OnboardingModel(
    title: 'onboarding.title2'.tr(),
    subTitle: 'onboarding.subtitle2'.tr(),
  ),

  OnboardingModel(
    title: 'onboarding.title3'.tr(),
    subTitle: 'onboarding.subtitle3'.tr(),
  ),
];
