import 'package:flutter/material.dart';
import 'package:flutter_aiyaya/main_pages/home_pages/home_classification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //头像部分
    var headPart = Stack(
      children: <Widget>[
        //消息小图标
        Positioned(
          child: InkWell(
            child: Container(
              child: Image.asset('assets/images/home_image/home_btn_msg.png'),
              width: ScreenUtil().setWidth(50.0),
              height: ScreenUtil().setHeight(50.0),
            ),
          ),
        ),

        //头像
        Positioned(
          top: 15.0,
          left: 40.0,
          child: Container(
            width: 81.0,
            height: 81.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.5),
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 5.0,
                  style: BorderStyle.solid,
                )),
            child: ClipOval(
              child: InkWell(
                //设置点击后的颜色 默认是透明白色
                highlightColor: Colors.transparent,
                //水波纹的颜色
                splashColor: Colors.transparent,
                onTap: () {
                  print('点击了图片');
                },
                child: Image.network(
                  'http://oss.img.2or3m.com/ayy_common/php/20210428/bbkhWpkj6m.jpg',
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        //名字
        Positioned(
          top: 90.0,
          left: 40.0,
          child: Container(
            width: 81.0,
            padding: const EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0, //阴影范围
                  spreadRadius: 1.0, //阴影浓度
                  color: Colors.pinkAccent,
                ),
              ],
            ),
            child: new GestureDetector(
              child: Text(
                '冯亮亮',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              onTap: () {
                print('object');
              },
            ),
          ),
        ),
      ],
    );

    //top widget

    Widget _topWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left icon
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 10.0),
            width: 131,
            height: 131,
            child: headPart,
          ),
          //center list
          Container(
            child: HomeClassification(
              width: 400.0,
              height: 81.0,
              defaultIndex: 0,
            ),
          ),
          //right icon
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ],
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topWidget(), //上半部分 widget
        ],
      ),
    );
  }
}
