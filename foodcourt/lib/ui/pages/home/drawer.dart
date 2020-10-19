import 'package:flutter/material.dart';
import 'package:foodcourt/ui/shared/size_fit.dart';

class FCHomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120.px,
              color: Colors.orange,
              alignment: Alignment(0, 0.5),
              child: Text("开始动手", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              margin: EdgeInsets.only(bottom: 10.px),
            ),
            buildItem(context, Icon(Icons.restaurant, color: Colors.black,), "进餐", () {
              Navigator.of(context).pop();
            }),
            buildItem(context, Icon(Icons.settings, color: Colors.black), "过滤", () {

            }),
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(title, style: TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}
