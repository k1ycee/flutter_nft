import 'package:epicnfts/locator.dart';
import 'package:epicnfts/utils/navigation.dart';
import 'package:epicnfts/utils/router.dart';
import 'package:epicnfts/views/create_wallet.dart';
import 'package:epicnfts/views/home.dart';
import 'package:epicnfts/vm/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  injector();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navService = inject<NavigationHandler>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      navigatorKey: _navService.navigatorKey,
      home: MultiProvider(
        providers: providers,
        child: CreateEthereumWallet(),
      ),
    );
  }
}
