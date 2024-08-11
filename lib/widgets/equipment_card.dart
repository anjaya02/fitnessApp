import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  const EquipmentCard(
      {super.key,
      required this.equipmentName,
      required this.equipmentDescription,
      required this.equipmentImageUrl,
      required this.noOfMinutes,
      required this.noOfCalories});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kSubtitleColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  equipmentImageUrl,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${noOfMinutes.toString()} mins of workout",
                        style: const TextStyle(
                            color: kMainSubPinkBlue, fontSize: 18),
                      ),
                      Text(
                        "${noOfCalories.toString()} Calories of workout",
                        style: const TextStyle(
                            color: kMainSubPinkBlue, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              equipmentDescription,
              style: const TextStyle(
                  color: Color(0xff737070),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
