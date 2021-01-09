import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/token/token.dart';
import 'package:icare_profissional/util/constants.dart';

class TokenRepository extends TokenAdapter {
  static Future<Token> saveToken(Token token) async {
    var dbToken = await Hive.openBox<Token>(Constants.BD_TOKEN);
    await dbToken.clear();
    await dbToken.add(token);
    return token;
  }

  static Future<List<Token>> allToken() async {
    var dbToken = await Hive.openBox<Token>(Constants.BD_TOKEN);
    return dbToken.values.toList();
  }

  static Future<String> getToken() async {
    var dbToken = await Hive.openBox<Token>(Constants.BD_TOKEN);
    return dbToken.values.toList().first.token;
  }
}
