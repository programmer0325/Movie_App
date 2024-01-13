
import 'dart:convert';
import 'package:movie_app/api/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';
   class Api {
     // API endpoint for fetching trending movies.
     static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Secrets.apiKay}';
     // Fetches a list of trending movies from the API.
     Future<List<Movie>> getTrendingMovies() async {
       // Send a GET request to the API endpoint.
       final response = await http.get(Uri.parse(_trendingUrl));
       // Check if the response status code is 200 (OK).
       if(response.statusCode == 200){
         // Decode the JSON response and extract the 'results' field.
         final decodedData = json.decode(response.body)['results'] as List;
          // print(decodedData);
         // Map the decoded data to a list of Movie objects using the Movie.fromJson factory constructor.
         return decodedData.map((movie) => Movie.fromJason(movie)).toList();
         // If the response status code is not 200, throw an exception.
       } else{
         throw Exception("something weird");
       }
     }
   }
