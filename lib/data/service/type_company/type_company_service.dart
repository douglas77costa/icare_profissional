
import 'package:icare_profissional/data/model/type_company/type_company.dart';
import 'package:icare_profissional/util/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'type_company_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class TypeCompanyService {

  factory TypeCompanyService(Dio dio, {String baseUrl}) = _TypeCompanyService;

  @GET('typecompany/list')
  Future<List<TypeCompany>> findAll();

}
