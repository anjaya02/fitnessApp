import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description});
  final String title;
  final String imageUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
          color: kSubtitleColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              // blurRadius: 2,
            )
          ]),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            imageUrl,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: kMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
