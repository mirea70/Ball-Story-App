import 'dart:ffi';

class HomeStadium {
  final String? name;
  final Team? team;
  final int? favoriteAthleteCode;
  final Long? ownerId;

  HomeStadium({this.name, this.team, this.favoriteAthleteCode, this.ownerId});

  void reset() {
    copyWith(name: null, team: null,   ownerId: null);
  }

  HomeStadium copyWith({String? name, Team? team, int? favoriteAthleteCode, Long? ownerId}) =>
      HomeStadium(
        name: name ?? this.name,
        team: team ?? this.team,
        favoriteAthleteCode: favoriteAthleteCode ?? this.favoriteAthleteCode,
        ownerId: ownerId ?? this.ownerId,
      );

  factory HomeStadium.fromJson(Map<String, dynamic> json) => HomeStadium(
    name: json['name'],
    team: json['team'],
    favoriteAthleteCode: json['favoriteAthleteCode'],
    ownerId: json['ownerId'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'team': team?.name,
    'favoriteAthleteCode': favoriteAthleteCode,
    'ownerId': 1,
  };
}

enum Team {
  LG("LG", "LG 트윈스"),
  HANWHA("HANWHA", "한화 이글스"),
  SAMSUNG("SAMSUNG", "삼성 라이온즈"),
  LOTTE("LOTTE", "롯데 자이언츠"),
  KT("KT", "KT 위즈"),
  KIA("KIA", "기아 타이거즈"),
  NC("NC", "NC 다이노스"),
  KIWOOM("KIWOOM", "키움 히어로즈"),
  DOOSAN("DOOSAN", "두산 베어스"),
  SSG("SSG", "SSG 랜더스");

  const Team(this.name, this.label);

  final String name;
  final String label;

  static Team fromString(String value) {
    return Team.values.firstWhere((e) => e.name == value,
            orElse: () => throw Exception("존재하지 않는 팀 값입니다."));
  }
}
