

import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/util/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'company_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class CompanyService {

  factory CompanyService(Dio dio, {String baseUrl}) = _CompanyService;

  @POST("company/save")
  Future<Company> createCompany(@Body() Company company);

  @PUT("company/update")
  Future<Company> updateCompany(@Body() Company company,@Header("Authorization") String token);

  @GET('company/list')
  Future<List<Company>> findAll();

  @GET("company/this")
  Future<Company> thisCompany(@Header("Authorization") String token);


}
