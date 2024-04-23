import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:srs5/pages/qr/bloc/qr_bloc.dart';
import 'package:srs5/pages/qr/bloc/qr_event.dart';
import 'package:srs5/pages/qr/bloc/qr_state.dart';

class QrScannPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BlocProvider(
        create: (context) => QrBloc(),
        child: QrScannerAndGeneratorPage(),
      ),
    );
  }
}

class QrScannerAndGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrScannerAndGeneratorView(),
    );
  }
}

class QrScannerAndGeneratorView extends StatefulWidget {
  @override
  _QrScannerAndGeneratorViewState createState() => _QrScannerAndGeneratorViewState();
}

class _QrScannerAndGeneratorViewState extends State<QrScannerAndGeneratorView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final qrTextController = TextEditingController();
  bool showScanner = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: showScanner ? buildQrView(context) : buildQrGenerator(context, state),
            ),
            if (!showScanner)
              Padding(
                padding: EdgeInsets.all(20),
                child: buildQrDataInput(context),
              ),
            buildToggleScannerButton(),
          ],
        );
      },
    );
  }

  Widget buildQrView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink, width: 4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: QRView(
        key: qrKey,
        onQRViewCreated: (QRViewController controller) {
          controller.scannedDataStream.listen((scanData) {
            context.read<QrBloc>().add(QrScanEvent(scanData.code ?? "No data"));
          });
        },
      ),
    );
  }

Widget buildQrGenerator(BuildContext context, QrState state) {
  String data = (state is QrDisplayState) ? state.data : "https://example.com";

  return Center(
    child: Image.network(
      'https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=$data',
      width: 200,
      height: 200,
    ),
  );
}

  Widget buildQrDataInput(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: qrTextController,
          decoration: InputDecoration(
            labelText: 'Enter data for QR Code',
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
            ),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
          onPressed: () {
            context.read<QrBloc>().add(QrCreateEvent(qrTextController.text));
          },
          child: Text('Generate QR Code'),
        ),
      ],
    );
  }

  Widget buildToggleScannerButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(showScanner ? Icons.qr_code : Icons.camera_alt, color: Colors.white),
        onPressed: () {
          setState(() {
            showScanner = !showScanner;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    qrTextController.dispose();
    super.dispose();
  }
}
