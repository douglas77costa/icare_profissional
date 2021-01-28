
import 'package:icare_profissional/data/model/token/token.dart';
import 'package:icare_profissional/data/model/user/user.dart';
import 'package:icare_profissional/data/request/login_request/login_request.dart';
import 'package:icare_profissional/util/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class UserService {

  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @GET("user/check/{email}")
  Future<bool> checkUser(@Path("email") String email);

  @POST("user/signup")
  Future<User> signupUser(@Body() User user);

  @POST("login")
  Future<Token> loginUser(@Body() LoginRequest loginRequest);

  @GET('user/list')
  Future<List<User>> findAll();

  @GET('user/profile')
  Future<User> profile(@Header("Authorization") String token);

  @PUT("user/update")
  Future<User> update(@Header("Authorization") String token,@Body() User user);

}
