class FrequetlyAskedQuestionsModel {
  final String titleQuestion;
  final String steps;

  FrequetlyAskedQuestionsModel({
    required this.titleQuestion,
    required this.steps,
  });
}

List<FrequetlyAskedQuestionsModel> questionsAndAnswerModel = [
  FrequetlyAskedQuestionsModel(
    titleQuestion: "How do I earn Loyalty Points?",
    steps:
        "You earn Loyalty Points automatically with every installment payment. Paying early earns you 2x points, and you can also earn extra points by referring friends.",
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestion: "How can I redeem my Loyalty Points?",
    steps:
        "You can redeem your Loyalty Points for exclusive rewards, discounts, or special offers available in the Rewards section of the app.",
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestion: "Do Loyalty Points expire?",
    steps:
        "Yes, Loyalty Points may expire after 12 months of inactivity. Make sure to use your points before they expire to enjoy available rewards.",
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestion: "Can I transfer my Loyalty Points to someone else?",
    steps:
        "No, Loyalty Points are linked to your account and cannot be transferred or shared with another user.",
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestion: "Where can I check my Loyalty Points balance?",
    steps:
        "You can view your current Loyalty Points balance and transaction history anytime from the Loyalty or Rewards section in the app.",
  ),
];
