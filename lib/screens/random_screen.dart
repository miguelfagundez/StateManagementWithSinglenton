import 'package:flutter/material.dart';
import 'dart:math';

import '../services/crypto_services.dart';
import 'package:flutter_state_management_singlenton/models/crypto_model.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crypto = CryptoServices();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Screen'),
        elevation: 3.0,
        backgroundColor: Colors.indigo,
      ),
      body: StreamBuilder<CryptoModel>(
          stream: crypto.cryptoStream,
          builder: (context, snapshot) {
            return RandomScreenBody(crypto: crypto);
          }),
    );
  }
}

class RandomScreenBody extends StatelessWidget {
  const RandomScreenBody({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  final CryptoServices crypto;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('Take a random crypto & Go back to HomeScreen'),
        ),
        const SizedBox(
          height: 20,
        ),
        const CryptoButton(),
        const SizedBox(
          height: 50,
        ),
        (crypto.hasPushed)
            ? Text('Winning Crypto: ${crypto.getCrypto?.cryptoName}')
            : const Text('Winning Crypto:'),
        (crypto.hasPushed)
            ? Text('Random is: ${crypto.randomNumber}')
            : const Text('Random is: '),
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
              'If the random number does not change it is because the value was repeated. Push again!'),
        ),
        const Text('')
      ],
    );
  }
}

class CryptoButton extends StatelessWidget {
  const CryptoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crypto = CryptoServices();
    final random = Random();

    return Center(
        child: SizedBox(
      height: 80,
      child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            final num = random.nextInt(crypto.getListLength! - 1);
            print('num = $num');
            if (!crypto.hasPushed) {
              crypto.hasPushed = true;
            }
            crypto.changeCrypto = num;
          },
          child: const Text(
            'Random number',
            style: TextStyle(color: Colors.white),
          )),
    ));
  }
}
