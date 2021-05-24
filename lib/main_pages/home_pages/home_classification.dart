import 'package:flutter/material.dart';
// ignore: must_be_immutable
class HomeClassification extends StatefulWidget {
  var defaultIndex; //默认索引
  final double width; //组件宽度
  final double height; //组件高度
  HomeClassification({this.width, this.height, this.defaultIndex}) : super();
  var controller = new ScrollController();

  @override
  _HomeClassificationState createState() => _HomeClassificationState();
}

class _HomeClassificationState extends State<HomeClassification> {
  List<String> names = ['冯亮亮', '王宏达', '赵旭宁', '牛朝阳', '牛朝鹏', '刘洋', '刘鹏', '夏利'];
  List<GlobalKey> keys = <GlobalKey>[];
  ScrollController _controller = ScrollController(keepScrollOffset: false);

  @override
  void initState() {
    for (int i = 0; i < names.length; i++) {
      keys.add(GlobalKey(debugLabel: i.toString()));
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: widget.height,
              width: widget.width,
              // margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              color: Colors.yellow,
              child: ScrollConfiguration(
                behavior: CusBehavior(),
                child: ListView.builder(
                    controller: _controller,
                    itemExtent: 100.0,
                    scrollDirection: Axis.horizontal,
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      print('================={$index}');
                      return initItem(index);
                    }),
              )),
        ],
      ),
    );
  }

//创建item
  Widget initItem(int index) {
    return Container(
      key: keys[index],
      child: InkWell(
        onTap: () {
          setState(() {
            widget.defaultIndex = index;
            scrollItemToCenter(widget.defaultIndex);
          });
        },
        child: Container(
            width:  100.0,
            height: 100.0,
            child: Column(
              children: <Widget>[
                Container(
                    height: 50,
                    width: 50,
                    child: Image.network(
                      widget.defaultIndex == index
                          ? 'http://oss.img.2or3m.com/ayy_common/php/20210428/bbkhWpkj6m.jpg'
                          : 'https://pics4.baidu.com/feed/0824ab18972bd407f8fb37bbc6a218590fb30968.jpeg?token=9c6ce7ea8958831959169c52005ba35b',
                      fit: BoxFit.fill,
                    )),
                Container(
                  child: Text(
                    '${names[index]}',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: widget.defaultIndex == index
                            ? Colors.pink
                            : Colors.black),
                  ),
                )
              ],
            )),
      ),
    );
  }

  //滚动Item到指定位置，这里滚动到屏幕正中间
  void scrollItemToCenter(int pos) {
    //获取item的尺寸和位置
    RenderBox box = keys[pos].currentContext.findRenderObject();
    Offset os = box.localToGlobal(Offset.zero);

//    double h=box.size.height;
    double w = box.size.width;
    double x = os.dx;
//    double y=os.dy;
//   获取屏幕宽高
    double windowW = MediaQuery.of(context).size.width;
    print('++++++++++++++++++{$windowW}');
//    double windowH=MediaQuery.of(context).size.height;
    //就算当前item距离屏幕中央的相对偏移量
    double rlOffset = windowW / 2 - (x + w / 2) + widget.width/2;
    //计算_controller应该滚动的偏移量
    double offset = _controller.offset - rlOffset;
    _controller.animateTo(offset,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}

class CusBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // if (Platform.isAndroid || Platform.isFuchsia) return child;
    return super.buildViewportChrome(context, child, axisDirection);
  }
}
