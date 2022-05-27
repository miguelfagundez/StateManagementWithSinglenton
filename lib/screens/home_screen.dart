import 'package:flutter/material.dart';
import 'package:flutter_state_management_singlenton/models/crypto_model.dart';
import 'package:flutter_state_management_singlenton/services/crypto_services.dart';

//************************************************************
// HomeScreen class
// Author: Miguel Fagundez
// Date: May, 27 2022
// This screen will show some crypto data
// This way we can handle some basic management state if we
// have just few screen and few variables in the app state
//************************************************************
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crypto = CryptoServices();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 3.0,
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder<CryptoModel>(
          stream: crypto.cryptoStream,
          builder: (BuildContext context, AsyncSnapshot<CryptoModel> snapshot) {
            return (snapshot.hasData)
                ? ShowCryptoInState(crypto: crypto)
                : const Center(
                    child: Text('No crypto found.'),
                  );
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan),
          onPressed: () {
            Navigator.pushNamed(context, 'random_crypto');
          }),
    );
  }
}

class ShowCryptoInState extends StatelessWidget {
  const ShowCryptoInState({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  final CryptoServices crypto;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Crypto Name: ${crypto.getCrypto?.cryptoName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Crypto Slug: ${crypto.getCrypto?.cryptoSlug}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            title: Text(
              'Crypto Logo: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Image.asset(
              (crypto.getCrypto?.cryptoImage != null)
                  ? crypto.getCrypto!.cryptoImage
                  : 'assets/question-mark.png',
              height: 40,
              width: 40,
            ),
          )
        ],
      ),
    );
  }
}
