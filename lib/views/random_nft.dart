import 'package:epicnfts/vm/create_wallet_vm.dart';
import 'package:epicnfts/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomNFT extends StatefulWidget {
  const RandomNFT({Key? key}) : super(key: key);

  @override
  _RandomNFTState createState() => _RandomNFTState();
}

class _RandomNFTState extends State<RandomNFT> {
  @override
  Widget build(BuildContext context) {
    final creationModel = Provider.of<CreateWalletViewModel>(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomText(
          creationModel.walletAddress,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        )
      ],
    ));
  }
}
