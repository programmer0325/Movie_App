import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

/// Provider class for managing the list of favorite movies.
class FavoriteMoviesProvider extends ChangeNotifier {
  /// Internal list to store favorite movies.
  final List<Movie> _favoriteMovies = [];

  /// Getter to access the list of favorite movies.
  List<Movie> get favoriteMovies => _favoriteMovies;

  /// Adds a movie to the list of favorite movies.
  void addFavoriteMovie(Movie movie) {
    // Add the movie to the list.
    _favoriteMovies.add(movie);

    // Notify listeners to update any widgets listening to changes in this provider.
    notifyListeners();

    // Print a message indicating that a movie has been added to favorites.
    print('Favorite movie added: ${movie.title}');
  }
}
