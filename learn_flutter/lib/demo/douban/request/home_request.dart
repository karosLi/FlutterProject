import '../network/http_request.dart';
import '../network/http_config.dart';
import '../model/home_model.dart';

class KKHomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    final String url = "/movie/top250";
    final result = await HttpRequest.request(url, params: {
      "apikey": HttpConfig.appKey,
      "start": start,
      "count": 20
    });

    final subjects = result["subjects"];

    List<MovieItem> list = [];
    for (var sub in subjects) {
      list.add(MovieItem.fromMap(sub));
    }

    return list;
  }
}