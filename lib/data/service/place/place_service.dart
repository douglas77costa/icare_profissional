
import 'package:icare_profissional/data/model/place/place.dart';
import 'package:icare_profissional/util/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'place_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class PlaceService {

  factory PlaceService(Dio dio, {String baseUrl}) = _PlaceService;

  @POST("place/save")
  Future<Place> createPlace(@Body() Place place);

  @GET("place/search_cep/{cep}")
  Future<Place> searchCep(@Path("cep") String cep);

  @GET("place/this")
  Future<Place> thisPlace(@Header("Authorization") String token);

  @PUT("place/update")
  Future<Place> updatePlace(@Header("Authorization") String token, @Body() Place place);

}