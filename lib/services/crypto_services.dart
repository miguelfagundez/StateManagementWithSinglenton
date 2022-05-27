// ===========================================
// BASIC SINGLENTON CLASS
// ===========================================

import 'dart:async';

import 'package:flutter_state_management_singlenton/models/crypto_model.dart';

//************************************************************
// CryptoServices class
// Author: Miguel Fagundez
// Date: May, 27 2022
// This is the singlenton class using factory
// Using StreamControllers we can control which widgets we
// want to update in the app
//************************************************************
class CryptoServices {
  static final CryptoServices _instance = CryptoServices._internal();

  // return only one Crypto Service instance
  factory CryptoServices() {
    return _instance;
  }

// My Variables - I need to keep my state
  CryptoModel? _crypto;
  List<CryptoModel>? _listCryptos;
  int? _randomNumber;
  bool _hasPushed = false;

// We can now re-draw our widgets
  final StreamController<CryptoModel> _cryptoStreamController =
      StreamController<CryptoModel>.broadcast();
  Stream<CryptoModel> get cryptoStream => _cryptoStreamController.stream;

  CryptoServices._internal() {
    // initialization logic
    initVariables();
  }

// Setters and Getters
  int? get getListLength => _listCryptos?.length;
  CryptoModel? get getCrypto => _crypto;
  int? get randomNumber => _randomNumber;
  bool get hasPushed => _hasPushed;

  set changeCrypto(int i) {
    _randomNumber = i;
    _crypto = _listCryptos![i];
    _cryptoStreamController.add(_crypto!);
  }

  set hasPushed(bool pushed) {
    _hasPushed = pushed;
  }

// Avoid memory leaks
  void closeStreamController() {
    _cryptoStreamController.close();
  }

// Initialization block
  void initVariables() {
    print('initialization services');
    _randomNumber = 0;

    _crypto = CryptoModel(
        cryptoName: 'Bitcoin',
        cryptoSlug: 'BTC',
        cryptoImage: 'assets/bitcoin.png');

    _cryptoStreamController.add(_crypto!);

    _listCryptos = [
      CryptoModel(
          cryptoName: 'Bitcoin',
          cryptoSlug: 'BTC',
          cryptoImage: 'assets/bitcoin.png'),
      CryptoModel(
          cryptoName: 'Ethereum',
          cryptoSlug: 'ETH',
          cryptoImage: 'assets/ethereum.png'),
      CryptoModel(
          cryptoName: 'Cardano',
          cryptoSlug: 'ADA',
          cryptoImage: 'assets/cardano.png'),
      CryptoModel(
          cryptoName: 'Coti',
          cryptoSlug: 'COTI',
          cryptoImage: 'assets/coti.png'),
      CryptoModel(
          cryptoName: 'Crypto.com',
          cryptoSlug: 'CRO',
          cryptoImage: 'assets/crypto-com.png'),
      CryptoModel(
          cryptoName: 'Decentraland',
          cryptoSlug: 'MANA',
          cryptoImage: 'assets/decentraland.png'),
      CryptoModel(
          cryptoName: 'Dogecoin',
          cryptoSlug: 'DOGE',
          cryptoImage: 'assets/dogecoin.png'),
      CryptoModel(
          cryptoName: 'Fantom',
          cryptoSlug: 'FTM',
          cryptoImage: 'assets/fantom.png'),
      CryptoModel(
          cryptoName: 'Shiba-Inu',
          cryptoSlug: 'SHIB',
          cryptoImage: 'assets/shiba-inu.png'),
      CryptoModel(
          cryptoName: 'Solana',
          cryptoSlug: 'SOL',
          cryptoImage: 'assets/solana.png'),
      CryptoModel(
          cryptoName: 'Tether',
          cryptoSlug: 'USDT',
          cryptoImage: 'assets/theter.png'),
    ];
  }
}
