import 'dart:collection';

import 'package:ballstory_app/config/DioConfig.dart';
import 'package:ballstory_app/model/Athlete.dart';
import 'package:ballstory_app/model/HomeStadium.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final athleteRepositoryProvider = Provider<AthleteRepository>((ref) {
  final dio = ref.read(dioProvider);
  return AthleteRepository(dio);
});

class AthleteRepository {
  final Dio dio;

  AthleteRepository(this.dio);

  Future<List<Athlete>> findAllByTeam(Team team) async {
    print('[AthleteRepository] findAllByTeam start...');

    String endpoint = "/v1/athletes";
    Map<String, dynamic> queryString = HashMap();
    queryString['team'] = team.name;

    final response = await dio.get(
      endpoint,
      queryParameters: queryString
    );

    List<Athlete> athletes = List<Map<String, dynamic>>.from(response.data)
        .map((item) {
      return Athlete.fromJson(item);
    }).toList();

    print(athletes.length);
    for(Athlete athlete in athletes) {
      print(athlete);
      print('\n');
    }

    return athletes;
  }
}