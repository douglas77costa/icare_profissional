import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/util/constants.dart';

class UserRepository{

  static Future<User> saveUser(User user)async{
    var dbUser = await Hive.openBox<User>(Constants.BD_USER);
    var index = await dbUser.add(user);
    user.id = index;
    dbUser.putAt(index, user);
    return user;
  }

  static Future<List<User>> allUser()async{
    var dbUser = await Hive.openBox<User>(Constants.BD_USER);
    return dbUser.values.toList();
  }



}