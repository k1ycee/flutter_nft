import 'package:epicnfts/utils/button_style.dart';
import 'package:epicnfts/utils/margins.dart';
import 'package:epicnfts/vm/create_wallet_vm.dart';
import 'package:epicnfts/widgets/custom_button.dart';
import 'package:epicnfts/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        children: [
          verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    creationModel.walletAddress,
                    fontSize: 14,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CustomText(
                    "Current Wallet Balance: ${creationModel.walletValue}",
                    fontSize: 14,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          verticalSpaceMassive,
          verticalSpaceMassive,
          CustomButton(
            onPressed: () => {
              creationModel.mintRandNFT()
            },
            textColor: Colors.white,
            buttonText: "Mint Random NFT",
            buttonStyle: buttonStyle(
              buttonWidth: 200,
              color: Colors.blue,
              buttonHeight: 45,
            ),
          ),
          verticalSpaceMedium,
          TextButton.icon(
            onPressed: () {
              _launchURL();
            },
            icon: Icon(Icons.launch),
            label: CustomText("View NFT collection", fontSize: 14, color: Colors.blueAccent,),
          )
        ],
      ),
    );
  }

  String _url =
      "https://testnets.opensea.io/${dotenv.env["CONTRACT_ADDRESS"]!}";

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
