import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';
import 'package:flutterappgym/data/user_data.dart';
import 'package:flutterappgym/models/equipment_model.dart';
import 'package:flutterappgym/models/exercise_model.dart';
import 'package:intl/intl.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final DateFormat formatter = DateFormat('EEEE,MMMM');
  final DateFormat dayFormatter = DateFormat('dd');

  final userData = user;

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
                  "Here are all your favorited Workouts",
                  style: TextStyle(
                      fontSize: 17,
                      color: kMainColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Exercises grid view
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 16 / 17,
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding),
                  itemCount: userData.favExerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise favExercise = userData.favExerciseList[index];
                    return Card(
                      color: const Color(0xffdcdcdc),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favExercise.exerciseName,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              favExercise.exerciseImageUrl,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${favExercise.noOfMinutes.toString()} of mins",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Here are all your favorited Equipments",
                  style: TextStyle(
                      fontSize: 17,
                      color: kMainColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Exercises grid view
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 16 / 17,
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding),
                  itemCount: userData.favEquipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment favEquipment = userData.favEquipmentList[index];
                    return Card(
                      color: const Color(0xffdcdcdc),
                      child: Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favEquipment.equipmentName,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Image.asset(
                              favEquipment.equipmentImageUrl,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${favEquipment.noOfMinutes.toString()} of mins",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
