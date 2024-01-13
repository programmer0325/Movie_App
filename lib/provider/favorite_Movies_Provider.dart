import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class FavoriteMoviesProvider extends ChangeNotifier {
  final List<Movie> _favoriteMovies = [];

  List<Movie> get favoriteMovies => _favoriteMovies;
  void addFavoriteMovie(Movie movie) {
    _favoriteMovies.add(movie);
    notifyListeners();
    print('Favorite movie added: ${movie.title}');
  }

}
