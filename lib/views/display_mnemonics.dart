import 'package:epicnfts/utils/button_style.dart';
import 'package:epicnfts/utils/margins.dart';
import 'package:epicnfts/vm/create_wallet_vm.dart';
import 'package:epicnfts/widgets/custom_button.dart';
import 'package:epicnfts/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayMnemonics extends StatefulWidget {
  const DisplayMnemonics({Key? key}) : super(key: key);

  @override
  _DisplayMnemonicsState createState() => _DisplayMnemonicsState();
}

class _DisplayMnemonicsState extends State<DisplayMnemonics> {
  @override
  Widget build(BuildContext context) {
    final creationModel =
        Provider.of<CreateWalletViewModel>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  "Mnemonics to remember",
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
                verticalSpaceMedium,
                CustomText(
                  "You see this random texts you see below yeah you have to actually take them more seroiusly memorize them, if it means jotting them down and then them putting it in a secure safe or to put in a safety deposit box, take your pick and actually do it they are as important as your sweet sweet ethereum",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            verticalSpaceLarge,
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: CustomText(
                  creationModel.mnemonic,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            verticalSpaceLarge,

            CustomButton(
              onPressed: () => {creationModel.selectMnemonics()},
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
