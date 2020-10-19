import 'package:flutter/material.dart';
import '../../widgets/dash_line.dart';
import '../../widgets/start_rating.dart';
import '../../model/home_model.dart';

class KKHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  KKHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 8,
            color: Color(0xffdddddd)
          )
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 6),
          buildContent(),
          SizedBox(height: 6),
          buildFooter(),
        ],
      ),
    );
  }

  // 头部
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text("No.${movie.rank}", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36))),
    );
  }

  // 内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(movie.imageURL, height: 150),
        ),
        SizedBox(width: 8),
        buildContentInfo(),
        SizedBox(width: 8),
        buildContentDashLine(),
        SizedBox(width: 8),
        buildContentWish()
      ],
    );
  }

  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(height: 8),
          buildContentInfoRating(),
          SizedBox(height: 8),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: Icon(Icons.play_circle_outline, color: Colors.redAccent),
              alignment: PlaceholderAlignment.middle
            ),
            WidgetSpan(
              child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              alignment: PlaceholderAlignment.middle
            ),
            ...movie.title.runes.map((e) {
              return WidgetSpan(
                  child: Text(String.fromCharCode(e), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  alignment: PlaceholderAlignment.middle
              );
            }),
            WidgetSpan(
              child: Text("(${movie.playDate})", style: TextStyle(fontSize: 18, color: Colors.grey))
            )
          ]
        )
    );
  }

  Widget buildContentInfoRating() {
    return Row(
      children: <Widget>[
        KKStarRating(
          rating: movie.rating,
          maxRating: 10,
          size: 20,
        ),
        SizedBox(width: 6),
        Text("${movie.rating}", style: TextStyle(fontSize: 16, color: Colors.grey))
      ],
    );
  }

  Widget buildContentInfoDesc() {
    final genresString = movie.genres.join(" ");
    final directorName = movie.director.name;
    final actorString = movie.casts.map((e) => e.name).join((" "));

    return Text(
      "$genresString / $directorName / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16)
    );
  }

  // 虚线
  Widget buildContentDashLine() {
    return Container(
      height: 100,
      child: KKDashLine(
        axis: Axis.vertical,
        dashedWidth: 0.5,
        dashedHeight: 6,
        color: Color.fromARGB(255, 235, 170, 60),
        count: 10,
      ),
    );
  }

  // 想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite, color: Color.fromARGB(255, 235, 170, 60)),
          Text("想看", style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)))
        ],
      ),
    );
  }

  // 底部
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Text(movie.originalTitle, style: TextStyle(fontSize: 16, color: Color(0xff666666))),
    );
  }
}
