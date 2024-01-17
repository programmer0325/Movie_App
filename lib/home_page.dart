import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/widgets/movie_slider.dart';
import 'package:movie_app/widgets/trending_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declaring a Future to fetch the trending movies.
  late Future<List<Movie>> trendingMovies;

// Declaring the initState function for fetching API class
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Initialize the Future to fetch trending movies using the Api class.
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Movie App",
          style: TextStyle(
              fontSize: 23,
              color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Trending Movies",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: FutureBuilder(
                    // Use FutureBuilder to asynchronously build UI based on the trendingMovies Future.
                      future: trendingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          // Display an error message if fetching data fails.
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          // If data is available, display the TrendingSlider widget.
                          return TrendingSlider(
                            snapshot: snapshot,
                          );
                        } else {
                          // Display a loading indicator while waiting for data.
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "new Movies",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const MoveSlider(),
             ],
            ),
        ),
      ),
    );
  }
}
