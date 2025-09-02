import 'package:ballstory_app/config/DioConfig.dart';
import 'package:ballstory_app/model/HomeStadium.dart';
import 'package:ballstory_app/model/HomeStadiumResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homaStadiumRepositoryProvider = Provider<HomeStadiumRepository>((ref) {
  final dio = ref.read(dioProvider);
  return HomeStadiumRepository(dio);
});

class HomeStadiumRepository {
  final Dio dio;

  HomeStadiumRepository(this.dio);

  Future<int> registerHomeStadium(HomeStadium stadium) async {
    String endpoint = "/v1/stadiums";
    Map<String, dynamic> body = stadium.toJson();

    try {
      final response = await dio.post(
        endpoint,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: body,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<HomeStadiumResponse> findOne(int stadiumId) async {
    print('[HomeStadiumRepository] findOne start...');
    String endpoint = "/v1/stadiums/$stadiumId";

    try {
      final response = await dio.get(
        endpoint,
      );

      return HomeStadiumResponse.fromJson(response.data);
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}