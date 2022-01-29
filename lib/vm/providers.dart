import 'package:epicnfts/vm/create_wallet_vm.dart';
import 'package:epicnfts/vm/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
  ChangeNotifierProvider(create: (_) => CreateWalletViewModel()),
];
