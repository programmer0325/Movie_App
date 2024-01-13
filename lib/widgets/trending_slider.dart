import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/details_screen.dart';

import '../api/secrets.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.snapshot});

// The AsyncSnapshot<T> class is a generic class that holds the latest data
// received from an asynchronous operation (like a Future or Stream).
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        // If the data is a List or any iterable type, 'itemCount' is often set to
        //   the length of the list, specifying how many items will be created.
        // - It's crucial to check if 'snapshot.data' is not null before accessing its properties.
        itemCount: snapshot.data.length,
        // this for CarouselOptions
        options: CarouselOptions(
          height: 400,
          autoPlay: true,
          viewportFraction: 0.60,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          // GestureDetector to navigates DetailsScreen
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(movie: snapshot.data[itemIndex]),
                ),
              );
            },
            // for border radius
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 500,
                width: 400,
                // so here fetch the image form API by using Image.network and posterPath
                child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    "${Secrets.imagePath}${snapshot.data[itemIndex].posterPath}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
