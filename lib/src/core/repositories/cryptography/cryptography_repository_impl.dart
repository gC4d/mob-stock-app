import 'dart:convert';
import 'dart:developer';
import 'package:mob_storage_app/src/core/repositories/cryptography/cryptography_repository.dart';

class CryptographyRepositoryImpl implements CryptographyRepository {
  @override
  Future<String> keyGenerator(String? description, String? password,
      DateTime datetime, String email) async {
    var keyPreEncode = description! +
        password! +
        datetime.day.toString() +
        datetime.hour.toString() +
        datetime.minute.toString() +
        email;

    String key = base64.encode(utf8.encode(keyPreEncode.toString().trim()));
    List<String> subKeys = key.split("");
    //log(subKeys.toString());
    //log(subKeys.length.toString());
    key = '';
    int aux = 0;
    for (String e in subKeys) {
      if (aux == 4 && key.length <= 10) aux = 0;
      if (aux == 0 || aux == 3) key += e;
      aux++;
    }
    log(key);
    return key;
  }
}
