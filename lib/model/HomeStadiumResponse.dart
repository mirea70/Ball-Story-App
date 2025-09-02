import 'package:ballstory_app/model/Athlete.dart';
import 'package:ballstory_app/model/HomeStadium.dart';

class HomeStadiumResponse {
  final int stadiumId;
  final String name;
  final Team team;
  final Athlete favoriteAthlete;
  final int ownerId;

  HomeStadiumResponse({
    required this.stadiumId,
    required this.name,
    required this.team,
    required this.favoriteAthlete,
    required this.ownerId,
  });

  factory HomeStadiumResponse.fromJson(Map<String, dynamic> json) =>
      HomeStadiumResponse(
        stadiumId: json['stadiumId'],
        name: json['name'],
        team: Team.fromString(json['team']),
        favoriteAthlete: Athlete.fromJson(json['favoriteAthlete']),
        ownerId: json['ownerId'],
      );
}
