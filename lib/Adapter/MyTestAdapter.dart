import 'package:flutter/material.dart';

class MyModel {
  final String name;
  const MyModel({this.name});
}

typedef void CartChangedCallback(MyModel model, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.model, this.inCart, this.onCartChanged})
      : super(key: new ObjectKey(model));
  final MyModel model;
  final bool inCart; //控制点击后的生成效果
  final CartChangedCallback onCartChanged; //Listening

  Color _getColor(BuildContext context) {
    //改变字体颜色点击 inCart 控制
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    //改变字体是否划线和无样式 inCart 控制
    if (!inCart) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(model, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(model.name[0]),
      ),
      title: new Text(model.name, style: _getTextStyle(context)),
    );
  }
}
