import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/colors.dart';
import 'package:flutterappgym/constants/responsive.dart';
import 'package:flutterappgym/models/equipment_model.dart';
import 'package:flutterappgym/widgets/equipment_card.dart';
import 'package:intl/intl.dart';

class EquipmentsPage extends StatefulWidget {
  final String equipmentTitle;
  final String equipmentDescription;
  final List<Equipment> equipmentList;
  const EquipmentsPage(
      {super.key,
      required this.equipmentTitle,
      required this.equipmentDescription,
      required this.equipmentList,
      required List<Equipment> EquipmentList});

  @override
  State<EquipmentsPage> createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage> {
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
              widget.equipmentTitle,
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
                height: 15,
              ),
              Text(
                widget.equipmentDescription,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff3B3636).withOpacity(.75)),
              ),
              const SizedBox(
                height: 15,
              ),
              // Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 16 / 10,
                    crossAxisCount: 1,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                      equipmentName: equipment.equipmentName,
                      equipmentDescription: equipment.equipmentDescription,
                      equipmentImageUrl: equipment.equipmentImageUrl,
                      noOfMinutes: equipment.noOfMinutes,
                      noOfCalories: equipment.noOfCalories);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
