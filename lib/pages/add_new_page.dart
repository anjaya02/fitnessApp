import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';
import 'package:flutterappgym/data/equipment_data.dart';
import 'package:flutterappgym/data/exercise_data.dart';
import 'package:flutterappgym/data/user_data.dart';
import 'package:flutterappgym/models/equipment_model.dart';
import 'package:flutterappgym/models/exercise_model.dart';
import 'package:flutterappgym/widgets/add_equipment_card.dart';
import 'package:flutterappgym/widgets/add_exercise_card.dart';
import 'package:intl/intl.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  final DateFormat formatter = DateFormat('EEEE,MMMM');
  final DateFormat dayFormatter = DateFormat('dd');

  final userData = user;
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
            padding: const EdgeInsets.all(kDefaultPadding),
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
                  "Hello, ${userData.fullName}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(
                      fontSize: 17,
                      color: kMainColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  "All exercises",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                // list view to scroll horizontally

                SizedBox(
                  height: MediaQuery.of(context).size.height * .31,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: exerciseList.length,
                      itemBuilder: (context, index) {
                        Exercise exercise = exerciseList[index];

                        return AddExerciseCard(
                          exerciseTitle: exercise.exerciseName,
                          exerciseImageUrl: exercise.exerciseImageUrl,
                          noOfMinutes: exercise.noOfMinutes,
                          isAdded: userData.exerciseList.contains(exercise),
                          toggleAddExercise: () {
                            setState(() {
                              if (userData.exerciseList.contains(exercise)) {
                                userData.removeExercise(exercise);
                                // print(userData.exerciseList.length);
                              } else {
                                userData.addExercise(exercise);
                              }
                              // print(userData.exerciseList.length);
                            });
                          },
                          isFavourited:
                              userData.favExerciseList.contains(exercise),
                          toggleFavExercise: () {
                            setState(() {
                              if (userData.favExerciseList.contains(exercise)) {
                                userData.removeFavExercise(exercise);
                              } else {
                                userData.addFavExercise(exercise);
                              }
                              // print(userData.favExerciseList.length);
                            });
                          },
                        );
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Equipment",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30 / 2,
                ),
                // list view to scroll vertically

                SizedBox(
                  height: MediaQuery.of(context).size.height * .4,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: equipmentList.length,
                      itemBuilder: (context, index) {
                        Equipment equipment = equipmentList[index];
                        return AddEquipmentCard(
                          equipmentName: equipment.equipmentName,
                          equipmentImageUrl: equipment.equipmentImageUrl,
                          noOfMinutes: equipment.noOfMinutes,
                          noOfCalories: equipment.noOfCalories,
                          toggleAddEquipment: () {
                            setState(() {
                              if (userData.equipmentList.contains(equipment)) {
                                userData.removeEquipment(equipment);
                              } else {
                                userData.addEquipment(equipment);
                              }
                            });
                            // print(userData.exerciseList.length);
                          },
                          isAddEquipment:
                              userData.equipmentList.contains(equipment),
                          toggleAddFavEquipment: () {
                            setState(() {
                              if (userData.favEquipmentList
                                  .contains(equipment)) {
                                userData.removeFavEquipment(equipment);
                              } else {
                                userData.addFavEquipment(equipment);
                              }
                            });
                            // userData.favEquipmentList.contains(equipment);
                          },
                          isAddFavEquipment:
                              userData.favEquipmentList.contains(equipment),
                        );
                      }),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
