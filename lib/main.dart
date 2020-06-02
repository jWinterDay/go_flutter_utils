import 'package:flutter/material.dart';

import 'package:desktop_utils/desktop_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'go-flutter plugin example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'go-flutter plugin example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _device;

  Widget _button(DesktopDeviceName device) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          DesktopUtils.setDevice(device);
          setState(() {
            _device = device.toString();
          });
        },
        highlightColor: Colors.red.withOpacity(0.3),
        child: Text(
          device.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _device,
              style: const TextStyle(color: Colors.red, fontSize: 18.0),
            ),
            SizedBox(height: 30),
            _button(DesktopDeviceName.iPhone5SE),
            _button(DesktopDeviceName.iPhone8),
            _button(DesktopDeviceName.iPhone8Plus),
            _button(DesktopDeviceName.iPhoneX),
            _button(DesktopDeviceName.nexus5),
            _button(DesktopDeviceName.nexus10),
            _button(DesktopDeviceName.pixel3),
          ],
        ),
      ),
    );
  }
}
