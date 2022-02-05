import 'package:bip39/bip39.dart' as bip39;
import 'package:web3dart/web3dart.dart';

class CreateWallet {
  String createMnemonic() {
    String mnemonic = bip39.generateMnemonic();
    return mnemonic;
  }

  // bool validateMnemonic(String mnemonic) {
  //   final isValid = bip39.validateMnemonic(mnemonic);
  //   return isValid;
  // }

  String generatePrivateKey(String mnemonics) {
    String privateKey = bip39.mnemonicToSeedHex(mnemonics);
    return privateKey;
  }

  Future<String> createWallet(String? privateKey) async {
    Credentials wallet = EthPrivateKey.fromHex(privateKey!);
    final walletAddress = await wallet.extractAddress();
    return walletAddress.hex;
  }
}
