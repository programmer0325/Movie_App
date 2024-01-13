
import 'dart:convert';
import 'package:movie_app/api/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';
   class Api {
     static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Secrets.apiKay}';


     Future<List<Movie>> getTrendingMovies() async {
       final response = await http.get(Uri.parse(_trendingUrl));
       if(response.statusCode == 200){
         final decodedData = json.decode(response.body)['results'] as List;
          // print(decodedData);
         return decodedData.map((movie) => Movie.fromJason(movie)).toList();
       } else{
         throw Exception("something weird");
       }
     }
   }
