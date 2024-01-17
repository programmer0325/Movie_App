import 'package:flutter/material.dart';

class MoveSlider extends StatelessWidget {
  const MoveSlider({super.key});

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
                onTap: () {},
                // for border radius
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 100,
                    width: 180,
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
