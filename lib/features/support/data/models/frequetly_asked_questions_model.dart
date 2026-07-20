class FrequetlyAskedQuestionsModel {
  final String titleQuestionKey;
  final String stepsKey;

  FrequetlyAskedQuestionsModel({
    required this.titleQuestionKey,
    required this.stepsKey,
  });
}

List<FrequetlyAskedQuestionsModel> questionsAndAnswerModel = [
  FrequetlyAskedQuestionsModel(
    titleQuestionKey: 'support.faq.earn_points_question',
    stepsKey: 'support.faq.earn_points_answer',
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestionKey: 'support.faq.redeem_points_question',
    stepsKey: 'support.faq.redeem_points_answer',
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestionKey: 'support.faq.expire_question',
    stepsKey: 'support.faq.expire_answer',
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestionKey: 'support.faq.transfer_question',
    stepsKey: 'support.faq.transfer_answer',
  ),
  FrequetlyAskedQuestionsModel(
    titleQuestionKey: 'support.faq.check_balance_question',
    stepsKey: 'support.faq.check_balance_answer',
  ),
];
