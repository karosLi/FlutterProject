import 'package:flutter/material.dart';
import '../../model/home_model.dart';
import '../../request/home_request.dart';
import 'home_movie_item.dart';

class KKHomeContent extends StatefulWidget {
  @override
  _KKHomeContentState createState() => _KKHomeContentState();
}

class _KKHomeContentState extends State<KKHomeContent> {
  final List<MovieItem> _movieList = [];

  @override
  void initState() {
    super.initState();
    KKHomeRequest.requestMovieList(0).then((value) {
      setState(() {
        _movieList.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movieList.length,
      itemBuilder: (ctx, index) {
        var movieItem = _movieList[index];
        return KKHomeMovieItem(movieItem);
      }
    );
  }
}
