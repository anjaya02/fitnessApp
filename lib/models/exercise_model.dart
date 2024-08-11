class Exercise {
  final int id;
  final String exerciseName;
  final String exerciseImageUrl;
  final int noOfMinutes;
  bool isCompleted;

  Exercise({
    required this.id,
    required this.exerciseName,
    required this.exerciseImageUrl,
    required this.noOfMinutes,
    required this.isCompleted,
  });
}
