import 'package:flutterappgym/models/exercise_model.dart';
import 'package:flutterappgym/models/user_model.dart';
import 'package:flutterappgym/models/equipment_model.dart';

User user = User(
  userId: "123456",
  fullName: "John Doe",
  age: 30,
  gender: "Male",
  address: "123 Main St, City, Country",
  description: "Fitness enthusiast",
  totalExercisesComplete: 0,
  totalEquipmentsHandovered: 0,
  exerciseList: [
    Exercise(
      exerciseName: "Push-ups",
      exerciseImageUrl: "assets/images/exercises/cobra.png",
      noOfMinutes: 15,
      id: 0,
      isCompleted: false,
    ),
    Exercise(
      exerciseName: "Squats",
      exerciseImageUrl: "assets/images/exercises/downward-facing.png",
      noOfMinutes: 20,
      id: 1,
      isCompleted: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercises.",
      equipmentImageUrl: "assets/images/equipments/checklist.png",
      noOfMinutes: 20,
      noOfCalories: 150,
      isHandOver: false,
    ),
    Equipment(
      id: 2,
      equipmentName: "Yoga Mat",
      equipmentDescription: "A mat for practicing yoga and floor exercises.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinutes: 60,
      isHandOver: false,
      noOfCalories: 300,
    ),
  ],
  favExerciseList: [
    Exercise(
      exerciseName: "Plank",
      exerciseImageUrl: "assets/images/exercises/dragging.png",
      noOfMinutes: 30,
      id: 2,
      isCompleted: false,
    ),
  ],
  favEquipmentList: [
    Equipment(
      id: 3,
      equipmentName: "Dumbbells",
      equipmentDescription: "Weights used for strength training.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinutes: 30,
      isHandOver: false,
      noOfCalories: 200,
    ),
  ],
);
