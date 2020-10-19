import 'package:flutter/material.dart';

class KKStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  KKStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = Colors.grey,
    this.selectedColor = Colors.red,
    Widget unselectedImage,
    Widget selectedImage,
  }): unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size),
      selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  _KKStarRatingState createState() => _KKStarRatingState();
}

class _KKStarRatingState extends State<KKStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          children: List.generate(widget.count, (index) => widget.unselectedImage),
        ),
        Row(
          children: buildSelectedStar(),
        )
      ],
    );
  }

  List<Widget> buildSelectedStar() {
    List<Widget> list = [];
    final star = widget.selectedImage;

    // 添加要填充的 star
    double oneStarValue = widget.maxRating / widget.count;
    int totalCount = ((widget.rating != null ? widget.rating : 0) / oneStarValue).floor();
    for (int i = 0; i < totalCount; i++) {
      list.add(star);
    }

    // 添加要部分填充的 star
    double leftWidth = (widget.rating != null ? widget.rating : 0) / oneStarValue - totalCount;
    list.add(ClipRect(
      child: star,
      clipper: KKCustomClipper(leftWidth),
    ));

    return list;
  }
}

class KKCustomClipper extends CustomClipper<Rect> {
  final double width;

  KKCustomClipper(this.width): super();

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * width, size.height);
  }

  @override
  bool shouldReclip(KKCustomClipper oldClipper) {
    return oldClipper.width != width;
  }

}
