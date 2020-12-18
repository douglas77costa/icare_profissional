
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/util/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class UserService {

  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET('user/list')
  Future<List<User>> findAll();

}
