
import 'package:icare_profissional/data/model/place/place.dart';
import 'package:icare_profissional/util/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'place_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class PlaceService {

  factory PlaceService(Dio dio, {String baseUrl}) = _PlaceService;

  @GET("place/search_cep/{cep}")
  Future<Place> searchCep(@Path("cep") String cep);

}