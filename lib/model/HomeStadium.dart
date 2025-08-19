import 'dart:ffi';

class HomeStadium {
  final String name;
  final Team? team;
  final Long? ownerId;

  HomeStadium({required this.name, required this.team, required this.ownerId});

  factory HomeStadium.init() {
    return HomeStadium(name: '', team: null, ownerId: null);
  }

  void reset() {
    copyWith(name: '', team: null, ownerId: null);
  }

  HomeStadium copyWith({String? name, Team? team, Long? ownerId}) =>
      HomeStadium(
        name: name ?? this.name,
        team: team ?? this.team,
        ownerId: ownerId ?? this.ownerId,
      );

  factory HomeStadium.fromJson(Map<String, dynamic> json) => HomeStadium(
    name: json['name'],
    team: json['team'],
    ownerId: json['ownerId'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'team': team,
    'ownerId': ownerId,
  };
}

enum Team {
  LG("LG 트윈스"),
  HANWHA("한화 이글스"),
  SAMSUNG("삼성 라이온즈"),
  LOTTE("롯데 자이언츠"),
  KT("KT 위즈"),
  KIA("기아 타이거즈"),
  NC("NC 다이노스"),
  KIWOOM("키움 히어로즈"),
  DOOSAN("두산 베어스"),
  SSG("SSG 랜더스");

  const Team(this.name);

  final String name;

  static Team fromString(String value) {
    return Team.values.firstWhere((e) => e.name == value);
  }
}
