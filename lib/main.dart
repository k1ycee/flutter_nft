import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConnectTest(),
    );
  }
}

class ConnectTest extends StatefulWidget {
  const ConnectTest({ Key? key }) : super(key: key);

  @override
  _ConnectTestState createState() => _ConnectTestState();
}

class _ConnectTestState extends State<ConnectTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}

