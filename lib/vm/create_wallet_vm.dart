import 'package:epicnfts/backend/wallet_creation.dart';
import 'package:epicnfts/locator.dart';
import 'package:epicnfts/utils/navigation.dart';
import 'package:epicnfts/utils/routes.dart';
import 'package:flutter/material.dart';

class CreateWalletViewModel extends ChangeNotifier {
  final walletUtil = CreateWallet();
  final navigate = inject<NavigationHandler>();

  String? _mnemonic;
  String get mnemonic => _mnemonic!;

  String? _privateKey;
  String get privateKey => _privateKey!;

  void generateMnemonic() {
    _mnemonic = walletUtil.createMnemonic();
    navigate.pushNamed(Routes.DisplayMnemonicsRoute);
    notifyListeners();
  }


  

  void genratePrivateKey(String mnemonics) {
    _privateKey = walletUtil.generatePrivateKey(mnemonics);
    notifyListeners();
  }
}
