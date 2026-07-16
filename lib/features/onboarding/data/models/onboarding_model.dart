class OnboardingModel {
  final String title, subTitle;

  OnboardingModel({required this.title, required this.subTitle});
}

final List<OnboardingModel> onBoardingModel = [
  OnboardingModel(
    title: 'Memar Degla',
    subTitle:
        'view all your units, contracts and payments schedules in one place',
  ),
  OnboardingModel(
    title: 'Earn Loyalty Points',
    subTitle: 'Get reward from every payment and friends referral',
  ),

  OnboardingModel(
    title: 'Redeem Rewards',
    subTitle:
        'Use your points for discounts, upgrades, and exceclusive services',
  ),
];
