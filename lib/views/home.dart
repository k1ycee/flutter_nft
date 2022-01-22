import 'package:epicnfts/views/custom_nft.dart';
import 'package:epicnfts/views/random_nft.dart';
import 'package:epicnfts/vm/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _widgetOptions = <Widget>[RandomNFT(), CustomNFT()];
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewModel>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive_rounded), label: "Get Random NFT"),
          BottomNavigationBarItem(
              icon: Icon(Icons.create), label: "Make Custom NFT"),
        ],
        currentIndex: model.selectedIndex,
        onTap: (value) => model.onItemTapped(value),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
      body: _widgetOptions.elementAt(model.selectedIndex),
    );
  }
}
