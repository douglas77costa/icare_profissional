import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/util/constants.dart';

class UserRepository {
  static Future<User> saveUser(User user) async {
    var dbUser = await Hive.openBox<User>(Constants.BD_USER);
    await dbUser.clear();
    await dbUser.put(user.id, user);
    return user;
  }

  static Future<List<User>> allUser() async {
    var dbUser = await Hive.openBox<User>(Constants.BD_USER);
    return dbUser.values.toList();
  }

  static Future<User> getUser() async {
    var dbUser = await Hive.openBox<User>(Constants.BD_USER);
    var user = dbUser.values.toList();
    return user.single;
  }
}
