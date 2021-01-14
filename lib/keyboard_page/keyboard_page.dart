import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_demo/dart/card_model.dart';

class KeyBoardPage extends StatefulWidget {
  KeyBoardPage({Key key, this.arguments}) : super(key: key);

  final arguments;
  @override
  _KeyBoardPageState createState() => _KeyBoardPageState();
}

class _KeyBoardPageState extends State<KeyBoardPage> {
  MyModel model = MyModel();
  int indexs = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.arguments["cart"];
    indexs = widget.arguments["index"];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: BackButton(),
        ),
        body: Container(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  SizedBox(
                      height: 68,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              // labelText: model.items[indexs].name,
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                size: 26,
                              ),
                            ),
                          ))),
                  SizedBox(
                      height: 68,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                size: 26,
                              ),
                            ),
                          ))),
                  SizedBox(
                      height: 68,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                size: 26,
                              ),
                            ),
                          ))),
                  SizedBox(
                      height: 68,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                size: 26,
                              ),
                            ),
                          ))),
                  SizedBox(
                      height: 68,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                size: 26,
                              ),
                            ),
                          ))),
                  SizedBox(
                      height: 68,
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                size: 26,
                              ),
                            ),
                          ))),
                ],
              ),
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 29, bottom: 20),
                child: SizedBox(
                  height: 42,
                  child: FlatButton(
                    child: Text("Next"),
                    textColor: Colors.white,
                    color: Color.fromARGB(255, 93, 160, 254),
                    onPressed: () {
                      setState(() {
                        model.upDataName("哈哈哈哈哦", indexs);
                        // model.removeItem(model.items[indexs]);
                        // widget.model = Item(price: 0, count: 0, name: "hello");
                      });
                    },
                  ),
                ))
          ],
        )));
  }
}
