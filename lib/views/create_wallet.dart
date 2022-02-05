import 'package:epicnfts/backend/wallet_creation.dart';
import 'package:epicnfts/utils/button_style.dart';
import 'package:epicnfts/utils/margins.dart';
import 'package:epicnfts/vm/create_wallet_vm.dart';
import 'package:epicnfts/widgets/custom_button.dart';
import 'package:epicnfts/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEthereumWallet extends StatefulWidget {
  const CreateEthereumWallet({Key? key}) : super(key: key);

  @override
  _CreateEthereumWalletState createState() => _CreateEthereumWalletState();
}

class _CreateEthereumWalletState extends State<CreateEthereumWallet> {
  @override
  Widget build(BuildContext context) {
    final creationModel = Provider.of<CreateWalletViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomText("Welcome to EpicNFTs"),
                verticalSpaceMedium,
                CustomText(
                  "Yeah so as usual some Lorem ipkiss yaddy yaddy yada boring text that you usually will not want to read, as usual but still standard prcedure for me to make it available in case you want to take a glance",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpaceLarge,
            CustomButton(
              onPressed: () => {
                creationModel.generateMnemonic(),
              },
              textColor: Colors.white,
              buttonText: "Get Started",
              buttonStyle: buttonStyle(
                  buttonWidth: 150, color: Colors.blue, buttonHeight: 45),
            ),
          ],
        ),
      ),
    );
  }
}

