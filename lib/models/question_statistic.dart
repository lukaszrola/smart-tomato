class QuestionStatistic {
  final int scheduledQuestions;
  int successAttempts = 0;
  int failedAttempts = 0;

  QuestionStatistic(this.scheduledQuestions);

  void addSuccessAttempt () {
    ++successAttempts;
  }

  void addFailedAttempt() {
    ++failedAttempts;
  }

  double get progress => (100.0 * successAttempts ) / scheduledQuestions;

  double get score => (100.0 * scheduledQuestions)  / (scheduledQuestions + failedAttempts);
}