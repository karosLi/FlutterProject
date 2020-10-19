import 'package:flutter/material.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';

class FCOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final double _space;

  FCOperationItem(this._icon, this._title, {double space}): this._space = space ?? 2.px;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.px,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          SizedBox(width: _space),
          Text(_title, style: TextStyle(fontSize: 14))
        ],
      ),
    );
  }
}
