import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class NftContractLinkUp {
  late Client httpClient;
  late Web3Client ethClient;

  NftContractLinkUp() {
    httpClient = Client();
    ethClient = Web3Client(dotenv.env["ETH_CLIENT"]!, httpClient);
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/epic_nft_abi.json");
    String contractAddress = dotenv.env["CONTRACT_ADDRESS"]!;

    final contract = DeployedContract(
      ContractAbi.fromJson(abi, "MyEpicNFT"),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<String> send(String functionName, List<dynamic> args) async {
    EthPrivateKey credential =
        EthPrivateKey.fromHex(dotenv.env["ETH_PRIVATEKEY"]!);

    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = ethClient.sendTransaction(
      credential,
      Transaction.callContract(
          contract: contract,
          function: ethFunction,
          parameters: args,
          maxGas: 300000),
      chainId: 4,
    );
    return result;
  }

  Future mintRandomNFT()async{
    await send("makeAnEpicRandomNFT", []);
  }

  Future getWalletInfo(String? privateKey) async {
    var credentials = EthPrivateKey.fromHex(dotenv.env["ETH_PRIVATEKEY"]!);
    EtherAmount balance = await ethClient.getBalance(credentials.address);
    return balance.getValueInUnit(EtherUnit.ether);
  }
}
