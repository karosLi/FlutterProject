import 'package:flutter/material.dart';

class KKImageDetailPage extends StatelessWidget {
  final String _src;

  KKImageDetailPage(this._src);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: _src,
            child: Image.network(
              _src,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
