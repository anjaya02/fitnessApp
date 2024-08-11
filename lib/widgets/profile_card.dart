import 'package:flutter/material.dart';
import 'package:flutterappgym/constants/responsive.dart';

class ProfileCard extends StatefulWidget {
  final String taskName;
  final String taskImageUrl;
  final void Function() markAsDone;

  const ProfileCard(
      {super.key,
      required this.taskName,
      required this.taskImageUrl,
      required this.markAsDone});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffdcdcdc)),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Image.asset(
              widget.taskImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.taskName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  widget.markAsDone();
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
