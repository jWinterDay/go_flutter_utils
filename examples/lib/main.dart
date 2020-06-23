import 'package:flutter/material.dart';
import 'package:go_flutter_utils/go_flutter_utils.dart';

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
  GoFlutterUtils _goFlutterUtils = GoFlutterUtils();

  String _device = 'default size';
  Map<String, dynamic> _osInfo = <String, dynamic>{};

  @override
  void initState() {
    super.initState();

    _goFlutterUtils.getInfo().then((Map<String, dynamic> info) {
      setState(() {
        _osInfo = info;
      });
    });
  }

  // device
  Widget _deviceSelectButton(DesktopDeviceName device) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            _goFlutterUtils.setDevice(device);
            setState(() {
              _device = device.toString();
            });
          },
          highlightColor: Colors.red.withOpacity(0.3),
          child: Text(
            device.toString(),
          ),
        ),
      ),
    );
  }

  List<Widget> _deviceView() {
    return [
      // device
      SliverToBoxAdapter(
        child: Text(
          _device,
          style: const TextStyle(color: Colors.red, fontSize: 18.0),
        ),
      ),

      // select device
      _deviceSelectButton(DesktopDeviceName.iPhone5SE),
      _deviceSelectButton(DesktopDeviceName.iPhone8),
      _deviceSelectButton(DesktopDeviceName.iPhone8Plus),
      _deviceSelectButton(DesktopDeviceName.iPhoneX),
      _deviceSelectButton(DesktopDeviceName.nexus5),
      _deviceSelectButton(DesktopDeviceName.nexus10),
      _deviceSelectButton(DesktopDeviceName.pixel3),

      SliverPadding(padding: const EdgeInsets.only(bottom: 24.0)),
    ];
  }

  // os info
  List<Widget> _osInfoView() {
    _osInfo.keys.map((String key) {
      final val = _osInfo[key].toString();
      final String str = '$key > $val';

      return SliverToBoxAdapter(
        child: Text(str),
      );
    });

    return [
      // device
      SliverToBoxAdapter(
        child: Text(
          'OS info',
          style: const TextStyle(color: Colors.red, fontSize: 18.0),
        ),
      ),

      ..._osInfo.keys.map((String key) {
        final val = _osInfo[key].toString();
        final String str = '$key > $val';

        return SliverToBoxAdapter(
          child: Text(str),
        );
      }),

      SliverPadding(padding: const EdgeInsets.only(bottom: 24.0)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(4.0),
        child: CustomScrollView(
          slivers: [
            // device
            ..._deviceView(),

            // os info
            ..._osInfoView(),
          ],
        ),
      ),
    );
  }
}
