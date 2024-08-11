import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';
import 'package:flutterappgym/data/user_data.dart';
import 'package:flutterappgym/models/equipment_model.dart';
import 'package:flutterappgym/models/exercise_model.dart';
import 'package:flutterappgym/widgets/profile_card.dart';
import 'package:flutterappgym/widgets/progress_card.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  // height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffdcdcdc)),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total mins spend: ${userData.calculateTotalMinsSpent().toString()}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kMainDarkBlue),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(
                          "Total exercises Completed: ${userData.totalExercisesComplete.toString()}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Total equipments Handovered: ${userData.totalEquipmentsHandovered.toString()}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Your Exercies",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: kMainDarkBlue),
                ),
                // list of the user
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise userExercise = userData.exerciseList[index];
                    return ProfileCard(
                        taskName: userExercise.exerciseName,
                        taskImageUrl: userExercise.exerciseImageUrl,
                        markAsDone: () {
                          setState(() {
                            userData.markExerciseAsDone(userExercise.id);
                          });
                        });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Your Equipments",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: kMainDarkBlue),
                ),
                // list of the user
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment userEquipment = userData.equipmentList[index];
                    return ProfileCard(
                        taskName: userEquipment.equipmentName,
                        taskImageUrl: userEquipment.equipmentImageUrl,
                        markAsDone: () {
                          setState(() {
                            userData.markEquipmentAsDone(userEquipment.id);
                          });
                        });
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
