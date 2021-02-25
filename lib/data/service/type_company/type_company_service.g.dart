// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_company_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TypeCompanyService implements TypeCompanyService {
  _TypeCompanyService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.0.2:8080/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TypeCompany>> findAll() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('typecompany/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TypeCompany.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
