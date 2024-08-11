import 'package:flutterappgym/models/equipment_model.dart';
import 'package:flutterappgym/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final int age;
  final String gender;
  final String address;
  final String description;

  int totalExercisesComplete;
  int totalEquipmentsHandovered;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favExerciseList;
  final List<Equipment> favEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.address,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favExerciseList,
    required this.favEquipmentList,
    this.totalEquipmentsHandovered = 0,
    this.totalExercisesComplete = 0,
  });

  // methods

  // method to add new exercise to the exerciseList
  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  // method to remove the exercise from exerciseList
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  // method to add exercise to favorites
  void addFavExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  // method to remove exercise from favorites
  void removeFavExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

  // method to add new equipment to user's equipmentList
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  // method to remove equipment from equipmentList
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  // method to add equipment to favorites
  void addFavEquipment(Equipment equipment) {
    favEquipmentList.add(equipment);
  }

  // method to remove equipment from favorites
  void removeFavEquipment(Equipment equipment) {
    favEquipmentList.remove(equipment);
  }

  // method to calculate the total minutes spent
  int calculateTotalMinsSpent() {
    int totalMinsSpend = 0;

    // loop through the exerciseList and calculate number of mins
    for (var exercise in exerciseList) {
      totalMinsSpend += exercise.noOfMinutes;
    }

    // loop through the equipmentList and calculate number of mins
    for (var equipment in equipmentList) {
      totalMinsSpend += equipment.noOfMinutes;
    }

    return totalMinsSpend;
  }

  // method to mark an exercise as completed
  void markExerciseAsDone(int exerciseId) {
    final exercise =
        exerciseList.firstWhere((exercise) => exercise.id == exerciseId);
    exercise.isCompleted = true;

    removeExercise(exercise);
    totalExercisesComplete++;
  }

  // method to handover equipment
  void markEquipmentAsDone(int equipmentId) {
    final equipment =
        equipmentList.firstWhere((equipment) => equipment.id == equipmentId);
    equipment.isHandOver = true;

    removeEquipment(equipment);
    totalEquipmentsHandovered++;
  }

  // Method to calculate the total number of calories burned by the user
  double calculateTotalCaloriesBurned() {
    double caloriesBurned = 0;
    for (var equipment in equipmentList) {
      caloriesBurned += equipment.noOfCalories;
    }
    // total number of calories burned into a value between 0 and 1
    if (caloriesBurned > 0 && caloriesBurned <= 10) {
      caloriesBurned = caloriesBurned / 10;
    }
    if (caloriesBurned > 10 && caloriesBurned <= 100) {
      caloriesBurned = caloriesBurned / 100;
    }
    if (caloriesBurned > 100 && caloriesBurned <= 1000) {
      caloriesBurned = caloriesBurned / 1000;
    }
    return caloriesBurned;
  }
}
