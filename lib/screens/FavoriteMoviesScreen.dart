import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/provider/favorite_Movies_Provider.dart';
import 'package:provider/provider.dart';
class FavoriteMoviesScreen extends StatefulWidget {
  const FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteMoviesScreen> createState() => _FavoriteMoviesScreenState();
}

class _FavoriteMoviesScreenState extends State<FavoriteMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // Watch for changes in the FavoriteMoviesProvider using context.watch().
        var favoriteMoviesProvider = context.watch<FavoriteMoviesProvider>();
        // Retrieve the list of favorite movies from the provider.
        List<Movie> favoriteMovies = favoriteMoviesProvider.favoriteMovies;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title:  Text('Favorite Movies',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          body: ListView.builder(
            // Use the length of the favoriteMovies list as the itemCount.
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  favoriteMovies[index].title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                ),
                // we can add more details or customize the UI as needed
              );
            },
          ),
        );
      },
    );
  }
}
