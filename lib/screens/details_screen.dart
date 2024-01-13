import 'package:flutter/material.dart';
import 'package:movie_app/api/secrets.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/provider/favorite_Movies_Provider.dart';
import 'package:movie_app/screens/FavoriteMoviesScreen.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    // Access the FavoriteMoviesProvider using the context.
    var favoriteMoviesProvider = context.read<FavoriteMoviesProvider>();
    return Scaffold(
     body: CustomScrollView(
       slivers: [
        SliverAppBar.large(
          expandedHeight: 500,
          pinned: true,
          floating: true,
          // Leading icon for navigating back to the previous screen.
          leading: Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(top: 16, left: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon:  Icon(Icons.arrow_back_ios_new, color: Theme.of(context).colorScheme.primary, ),),
          ),
          flexibleSpace: FlexibleSpaceBar(
            //title
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
              child: Image.network(
                '${Secrets.imagePath}${movie.posterPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
         // Details section of the movie.
      SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10,),
                // Movie overview.
                Text(
                  movie.overview,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10,),
                // Release date and rating.
                SizedBox(
                  child: Row(
                    children: [
                      // Release date.
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade800, width: 2,),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Release date: ",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              movie.releaseDate,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      // Rating.
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade800, width: 2,),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Rating",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            const Icon(Icons.star, color: Colors.amber,),
                            Text(
                              '${movie.voteAverage.toStringAsFixed(1)}/10',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                // Additional movie information.
                SizedBox(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade800, width: 2,),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              movie.mediaType,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      // Backdrop path.
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade800, width: 2,),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              movie.backDropPath,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Button to add the movie to favorites.
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      var favoriteMoviesProvider = context.read<FavoriteMoviesProvider>();
                      favoriteMoviesProvider.addFavoriteMovie(movie);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const FavoriteMoviesScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(350, 50),
                    ),
                    child: Text(
                      'Favorite',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
      ]
     ),
    );
  }
}
