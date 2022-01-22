import 'package:flutter/material.dart';

class CustomNFT extends StatefulWidget {
  const CustomNFT({Key? key}) : super(key: key);

  @override
  _CustomNFTState createState() => _CustomNFTState();
}

class _CustomNFTState extends State<CustomNFT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Custom NFT's"),
      ),
    );
  }
}
