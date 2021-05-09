import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult = "กรุณากดปุ่มสแกน";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
        centerTitle: true,
        backgroundColor: Colors.yellow[600],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "ผลลัพธ์",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 40.0,
              width: double.infinity,
              child: RaisedButton.icon(
                onPressed: () async {
                  String codeSanner =
                      await BarcodeScanner.scan(); //barcode scnner
                  setState(() {
                    qrCodeResult = codeSanner;
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                label: Text(
                  'Scan QR Code',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.black,
                ),
                textColor: Colors.black,
                color: Colors.yellow[600],
              ),
            ),
            // FlatButton(
            //   padding: EdgeInsets.all(15.0),
            //   color: Colors.yellow[600],
            //   onPressed: () async {
            //     String codeSanner =
            //         await BarcodeScanner.scan(); //barcode scnner
            //     setState(() {
            //       qrCodeResult = codeSanner;
            //     });

            //     // try{
            //     //   BarcodeScanner.scan()    this method is used to scan the QR code
            //     // }catch (e){
            //     //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
            //     //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
            //     // }
            //   },
            //   child: Text(
            //     "Scan QR Code",
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16),
            //   ),
            //   shape: RoundedRectangleBorder(
            //       side: BorderSide(color: Colors.white, width: 3.0),
            //       borderRadius: BorderRadius.circular(20.0)),
            // )
          ],
        ),
      ),
    );
  }
}
