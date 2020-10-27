import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeyBoardPage extends StatefulWidget {
  KeyBoardPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KeyBoardPageState createState() => _KeyBoardPageState();
}

class _KeyBoardPageState extends State<KeyBoardPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 29, bottom: 20),
            child: SizedBox(
              height: 42,
              child: FlatButton(
                child: Text("Next"),
                textColor: Colors.white,
                color: Color.fromARGB(255, 93, 160, 254),
                onPressed: () {},
              ),
            ))
      ],
    )));
  }
}
