import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //定义标题行
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              new Text(
                'Kandersteg,Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500]
                ),
              )
            ],
          ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41')
        ],
      ),
    );

    //定义个创建按钮的通用方法
    Column buildButtonColumn(IconData icon,String label){
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon,color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color
              ),
            ),
          ),
        ],
      );
    }

    //开始构建按钮行
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call,'CALL'),
          buildButtonColumn(Icons.near_me,'ROUTE'),
          buildButtonColumn(Icons.share,'SHARE'),
        ],
      ),
    );

    //构建大文本行
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
       你强任你强，东皇加张良。 生命与信念都交托阁下。自己选择的路，再荒谬也要走完。一个人可以被毁灭，但绝不可以被打败。
       当你凝视深渊的时候，深渊也在凝视你。生死契阔，与子成说。执子之手，与子偕老。若轻云之蔽月，若流风之回雪。十步杀一人，千里不留行。
       凤凰鸣矣，于彼高岗。静如影，疾如风。不动如山，迅烈如火。有朋友自远方来，不亦乐乎。
       嘘……好奇心会害死猫。
       如果这世上还有什么我不懂的学问，那就是女孩。
       ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new ListView(
           children: <Widget>[
             new Image.asset(
               'images/lake.jpg',
               width: 600.0,
               height: 240.0,
               fit: BoxFit.cover,
             ),
             titleSection,
             buttonSection,
             textSection
           ],

        ),
      ),
    );
  }
}


