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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DisplayMnemonics()),
                // ),
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

class DisplayMnemonics extends StatelessWidget {
  const DisplayMnemonics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creationModel = Provider.of<CreateWalletViewModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomText("Mnemonics to remember"),
                verticalSpaceMedium,
                CustomText(
                  "You see this random texts you see below yeah you have to actually take them more seroiusly memorize them, if it means jotting them down and then them putting it in a secure safe or to put in a safety deposit box, take your pick and actually do it they are as important as your sweet sweet ethereum",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpaceLarge,
            CustomText(
              creationModel.mnemonic,
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            CustomButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemorizeMnemonics()),
                ),
              },
              textColor: Colors.white,
              buttonText: "Next",
              buttonStyle: buttonStyle(
                buttonWidth: 150,
                color: Colors.blue,
                buttonHeight: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemorizeMnemonics extends StatelessWidget {
  const MemorizeMnemonics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final creationModel = Provider.of<CreateWalletViewModel>(context);
    return Scaffold();
  }
}
