import 'package:flutter/material.dart';
import 'package:movie_app/api/secrets.dart';
import 'package:movie_app/screens/details_screen.dart';

class MoveSlider extends StatelessWidget {
  const MoveSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(movie: snapshot.data[index]),
                    ),
                  );
                },
                // for border radius
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 100,
                    width: 180,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
