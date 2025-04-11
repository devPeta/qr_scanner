import 'package:flutter/material.dart';
class ScanCode extends StatefulWidget {
  const ScanCode({Key? key}) : super(key: key);

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      appBar: AppBar(
        backgroundColor: Color(0xfffefefe),
        title: Text('QR SCAN CODE', style: TextStyle( color: Colors.black45, fontSize: 18, fontWeight: FontWeight.w500), ),
        centerTitle: false,
        actions: [
          Icon(Icons.qr_code, color: Colors.teal, size: 24,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                  flex:5,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated
                  )),
              Expanded(
                  flex:1,
                  child: Center(
                   child: (result != null) ?
                   Text('Barcode Data : ${result!.code}', style: TextStyle( color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w200),)
                          :
                      Text('Scan a Code', style: TextStyle( color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w200),),

                  )),
            ],
          ),
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _launchInBrowser(result!.code.toString());
      });
    });
  }

  void _launchInBrowser(String string) async {
    await launchUrl(Url.parse(String));
  }
}
