import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';
import 'package:flutterappgym/models/exercise_model.dart';
import 'package:flutterappgym/widgets/exercise_card.dart';
import 'package:intl/intl.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDescription;
  final List<Exercise> ExerciseList;
  const ExerciseDetailsPage(
      {super.key,
      required this.exerciseTitle,
      required this.exerciseDescription,
      required this.ExerciseList});

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  // Date and Time Formatters

  final DateFormat formatter = DateFormat('EEEE,MMMM');
  final DateFormat dayFormatter = DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formatter.format(now);
    String dayFormat = dayFormatter.format(now);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "$formattedDate $dayFormat",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff606060)),
            ),
            Text(
              widget.exerciseTitle,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              const SizedBox(
                height: 11,
              ),
              Text(
                widget.exerciseDescription,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff3B3636).withOpacity(0.75),
                ),
              ),
              const SizedBox(
                height: 22,
              ),

              // grid view
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding),
                itemCount: widget.ExerciseList.length,
                itemBuilder: (context, index) {
                  Exercise exercise = widget.ExerciseList[index];
                  return ExerciseCard(
                      title: exercise.exerciseName,
                      imageUrl: exercise.exerciseImageUrl,
                      description: "${exercise.noOfMinutes} of Workouts.");
                },
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
