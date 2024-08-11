import 'package:flutter/material.dart';

class AddExerciseCard extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseImageUrl;
  final int noOfMinutes;
  final bool isAdded;
  final bool isFavourited;
  final void Function() toggleAddExercise;
  final void Function() toggleFavExercise;

  const AddExerciseCard({
    super.key,
    required this.exerciseTitle,
    required this.exerciseImageUrl,
    required this.noOfMinutes,
    required this.toggleAddExercise,
    required this.isAdded,
    required this.isFavourited,
    required this.toggleFavExercise,
  });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      width: 200,
      height: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffdcdcdc),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text(
              widget.exerciseTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              widget.exerciseImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 9),
            Text(
              "${widget.noOfMinutes.toString()} Minutes",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xff0147FC),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          widget.toggleAddExercise();
                        },
                        icon: Icon(
                          widget.isAdded ? Icons.remove : Icons.add,
                          size: 25,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        widget.toggleFavExercise();
                      },
                      icon: Icon(
                        widget.isFavourited
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 35,
                        color: const Color(0xffFF0000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
