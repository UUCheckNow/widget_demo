import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dong_scan/scan.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String qrResult = "";
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("扫一扫"),
        leading: BackButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            alignment: Alignment.center,
            child: FlatButton(
              color: Colors.teal,
              child: Text("方案一：扫一扫"),
              onPressed: () async {
                ScanConfig scanConfig = ScanConfig();
                SDScan scan =
                    SDScan().setScanEventListener((dynamic codeString) {
                  print("扫描结果:" + codeString);
                  setState(() {
                    qrResult = codeString;
                  });
                });
                scan.startScan(config: scanConfig);
              },
            ),
          ),
          Center(child: Text("扫描1结果：$qrResult")),
          // FlatButton(
          //   color: Colors.teal,
          //   child: Text("方案二：扫一扫"),
          //   onPressed: () {
          //     _scan();
          //   },
          // ),
          // Center(child: Text("扫描2结果：$barcode"))
        ],
      ),
    );
  }

  // Future _scan() async {
  //   String barcode = await scanner.scan();
  //   if (barcode == null) {
  //     print('nothing return.');
  //   } else {
  //     setState(() {
  //       this.barcode = barcode;
  //     });
  //     // _displayDialog();
  //   }
  // }
}
