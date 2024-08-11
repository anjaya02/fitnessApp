import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  final bool isAddEquipment;
  final bool isAddFavEquipment;
  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavEquipment;

  const AddEquipmentCard(
      {super.key,
      required this.equipmentName,
      required this.equipmentImageUrl,
      required this.noOfMinutes,
      required this.noOfCalories,
      required this.toggleAddEquipment,
      required this.isAddEquipment,
      required this.toggleAddFavEquipment,
      required this.isAddFavEquipment});

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 28),
      height: 200,
      decoration: BoxDecoration(
          color: const Color(0xffdcdcdc),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.equipmentName,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.equipmentImageUrl,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Text(
                      "${widget.noOfMinutes.toString()} mins of workout",
                      style: const TextStyle(
                          fontSize: 19,
                          color: Color(0xff0193FC),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${widget.noOfCalories} Calories will burn",
                      style: const TextStyle(
                          fontSize: 19,
                          color: Color(0xff0193FC),
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff0147FC),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                widget.toggleAddEquipment();
                              },
                              icon: Icon(
                                widget.isAddEquipment
                                    ? Icons.remove
                                    : Icons.add,
                                size: 21.5,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 95,
                        ),
                        Center(
                          child: IconButton(
                            onPressed: () {
                              widget.toggleAddFavEquipment();
                            },
                            icon: Icon(
                              widget.isAddFavEquipment
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 35,
                              color: const Color(0xffFF0000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
