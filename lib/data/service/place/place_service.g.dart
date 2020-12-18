// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PlaceService implements PlaceService {
  _PlaceService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://icare-app-br.herokuapp.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Place> searchCep(cep) async {
    ArgumentError.checkNotNull(cep, 'cep');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'place/search_cep/$cep',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Place.fromJson(_result.data);
    return value;
  }
}
