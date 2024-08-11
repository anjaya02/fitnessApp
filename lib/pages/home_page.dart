import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';
import 'package:flutterappgym/data/equipment_data.dart';
import 'package:flutterappgym/data/exercise_data.dart';
import 'package:flutterappgym/data/user_data.dart';
import 'package:flutterappgym/models/user_model.dart';
import 'package:flutterappgym/pages/equipments_page.dart';
import 'package:flutterappgym/pages/exercise_details_page.dart';
import 'package:flutterappgym/widgets/exercise_card.dart';
import 'package:flutterappgym/widgets/progress_card.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Date and Time Formatters

  final DateFormat formatter = DateFormat('EEEE,MMMM');
  final DateFormat dayFormatter = DateFormat('dd');

  // User Data
  final userData = User;
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formatter.format(now);
    String dayFormat = dayFormatter.format(now);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding + 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$formattedDate $dayFormat",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff606060)),
                ),
                Text(
                  user.fullName,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: kMainBlackColor),
                ),
                const SizedBox(
                  height: 25,
                ),
                ProgressCard(
                  progressValue: user.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Today's Activity",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Warmups",
                              exerciseDescription:
                                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                              ExerciseList: exerciseList,
                            ),
                          ),
                        );
                      },
                      child: const ExerciseCard(
                        title: "Warmup",
                        imageUrl: "assets/images/exercises/cobra.png",
                        description: "see more...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EquipmentsPage(
                                      equipmentTitle: "Equipment",
                                      equipmentDescription:
                                          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                      EquipmentList: equipmentList,
                                      equipmentList: equipmentList,
                                    )));
                      },
                      child: const ExerciseCard(
                        title: "Equipment",
                        imageUrl: "assets/images/equipments/dumbbells2.png",
                        description: "see more...",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseDetailsPage(
                                      exerciseTitle: "Exercises",
                                      exerciseDescription:
                                          "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                      ExerciseList: exerciseList,
                                    )));
                      },
                      child: const ExerciseCard(
                          title: "Exercise",
                          imageUrl: "assets/images/exercises/dragging.png",
                          description: "see more..."),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseDetailsPage(
                                    exerciseTitle: "Stretching",
                                    exerciseDescription:
                                        "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.",
                                    ExerciseList: exerciseList)));
                      },
                      child: const ExerciseCard(
                          title: "Stretching",
                          imageUrl: "assets/images/exercises/yoga.png",
                          description: "see more..."),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
