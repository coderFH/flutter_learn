import 'package:learn_flutter/service/config.dart';
import 'package:learn_flutter/service/http_request.dart';

import '.././model/home_model.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    //1.构建URL
    final movieUrl = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";

    //2.发送网络请求
    final result = await HttpRequest.request(movieUrl);
    final subjects = result["subjects"];

    //3.将map转model
    List<MovieItem> movies = [];
    for(var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    return movies;
  }
}
