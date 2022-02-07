import 'package:epicnfts/backend/nft_linkup.dart';
import 'package:epicnfts/backend/wallet_creation.dart';
import 'package:epicnfts/locator.dart';
import 'package:epicnfts/utils/list_shuffler.dart';
import 'package:epicnfts/utils/navigation.dart';
import 'package:epicnfts/utils/routes.dart';
import 'package:flutter/material.dart';

class CreateWalletViewModel extends ChangeNotifier {
  final walletUtil = CreateWallet();

  final walletInfo = NftContractLinkUp();
  final navigate = inject<NavigationHandler>();

  String? _mnemonic = "";
  String get mnemonic => _mnemonic!;

  bool? _isSelected = false;
  bool get isSelected => _isSelected!;

  String? _privateKey;
  String get privateKey => _privateKey!;

  String? _walletAddress;
  String get walletAddress => _walletAddress!;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _walletValue;
  String get walletValue => _walletValue!;

  List<String> _mnemonics = [];

  List<String>? _mnemonicList;
  List<String>? _reArrangedmnemonicList;
  List<String> get reArrangedmnemonicList => _reArrangedmnemonicList!;

  void generateMnemonic() {
    _mnemonic = walletUtil.createMnemonic();
    navigate.pushNamed(Routes.DisplayMnemonicsRoute);
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void selectMnemonics() {
    _mnemonicList = _mnemonic!.split(" ");
    _reArrangedmnemonicList = shuffle(_mnemonicList!);
    navigate.pushNamed(Routes.MemorizeMnemonicsRoute);
    notifyListeners();
  }

  void collectMnemonics(String mnemonic) {
    _mnemonics.add(mnemonic);
    notifyListeners();
  }

  void createEthereumWallet() async {
    setLoading(true);
    _privateKey = walletUtil.generatePrivateKey(_mnemonics.join().toString());
    _walletAddress = await walletUtil.createWallet(_privateKey);
    print(_walletAddress);
    setLoading(false);
    notifyListeners();
  }

  void getWalletInformation() async {
    setLoading(true);
    final walletValue = await walletInfo.getWalletInfo(_privateKey);
    _walletValue = walletValue.toString();
    navigate.pushNamed(Routes.HomeRoute);
    setLoading(false);
    notifyListeners();
  }

  void select() {
    _isSelected = !_isSelected!;
    notifyListeners();
  }

  void mintRandNFT()async{
    final res = await walletInfo.mintRandomNFT();
    print(res);
  }
}
