import 'package:epicnfts/utils/button_style.dart';
import 'package:epicnfts/utils/margins.dart';
import 'package:epicnfts/vm/create_wallet_vm.dart';
import 'package:epicnfts/widgets/custom_button.dart';
import 'package:epicnfts/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemorizeMnemonics extends StatefulWidget {
  const MemorizeMnemonics({Key? key}) : super(key: key);

  @override
  _MemorizeMnemonicsState createState() => _MemorizeMnemonicsState();
}

class _MemorizeMnemonicsState extends State<MemorizeMnemonics> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final creationModel = Provider.of<CreateWalletViewModel>(context);
    return Scaffold(
      body: creationModel.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        "Please Input your Mnemonic keys",
                        fontSize: 20,
                        textAlign: TextAlign.center,
                      ),
                      verticalSpaceMedium,
                      CustomText(
                        "So now you're in the final stages of creating your ethereum wallet, all we need you to do is to input your mnemonic keys in the order the appeared in the previous screen, this is importan because all of this is not happening online so there really is no record of your mnemonic keys, so you have to take some responsibility for your privacy here, and it is also important for you to understand that the mnemonic keys MUST be according to the previous page",
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 350,
                  width: double.infinity,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemCount: creationModel.reArrangedmnemonicList.length,
                    itemBuilder: (context, index) {
                      return MnemonicCard(
                        // isSelected: selectedIndex == index ? Colors.green : Colors.amber,
                        // onTap: () {
                        //   setState(() {
                        //     selectedIndex = index;
                        //   });
                        //   creationModel.select();
                        // },
                        mnemonicKey:
                            creationModel.reArrangedmnemonicList[index],
                      );
                    },
                  ),
                ),
                // verticalSpaceMedium,
                CustomButton(
                  onPressed: () => {creationModel.createEthereumWallet()},
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
    );
  }
}

class MnemonicCard extends StatefulWidget {
  final String? mnemonicKey;
  const MnemonicCard({Key? key, this.mnemonicKey}) : super(key: key);

  @override
  _MnemonicCardState createState() => _MnemonicCardState();
}

class _MnemonicCardState extends State<MnemonicCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final creationModel = Provider.of<CreateWalletViewModel>(context);
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        creationModel.collectMnemonics("${widget.mnemonicKey} ");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 45,
          width: 214,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected ? Colors.greenAccent : Colors.grey,
            ),
            color: isSelected ? Colors.greenAccent : Colors.transparent,
          ),
          child: Center(
            child: CustomText(
              widget.mnemonicKey,
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.greenAccent,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
