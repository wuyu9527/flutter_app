import 'package:flutter/material.dart';
import 'package:flutter_app/Adapter/MyTestAdapter.dart';

class MyApp extends StatelessWidget {
  final Widget title;

  MyApp({this.title});

  @override
  Widget build(BuildContext context) {
    Container container = new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,
            tooltip: '导航菜单',
          ),
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: null,
            tooltip: '搜索',
          )
        ],
      ),
    );

    return container;
  }
}

class MyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Material material = new Material(
        child: new Column(
      children: <Widget>[
        new MyApp(
            title: new Text('我的测试',
                style: Theme.of(context).primaryTextTheme.title)),
        new Expanded(
            child: new Center(
          child: new Text('Hello World'),
        ))
      ],
    ));
    return material;
  }
}

class MyTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          onPressed: null,
          tooltip: '导航应用',
        ),
        title: new Text('实例应用'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: null,
            tooltip: '搜索',
          )
        ],
      ),
      body: new Center(
        child: new Text('测试'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: '增加',
        child: new Icon(Icons.add),
      ),
    );
    return scaffold;
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton 被监听了');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(5.0),
            color: Colors.red[300]),
        child: new Center(
          child: new Text('点击监听'),
        ),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.myModels}) : super(key: key);
  final List<MyModel> myModels;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<MyModel> _shoppingCart = new Set<MyModel>();

  void _handleCartChanged(MyModel myModel, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.add(myModel);
      else
        _shoppingCart.remove(myModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        //标题栏
        title: new Text('购物清单'),
      ),
      body: new ListView(
        //主体
        children: widget.myModels.map((MyModel myModel) {
          return new ShoppingListItem(
            model: myModel,
            inCart: _shoppingCart.contains(myModel),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

final List<MyModel> _MyModel = <MyModel>[
  new MyModel(name: '这是第一'),
  new MyModel(name: '这是第二'),
  new MyModel(name: '这是第三'),
];

void main() {
  runApp(new MaterialApp(
    title: '我的应用',
    home: new ShoppingList(myModels: _MyModel),
  ));
}
