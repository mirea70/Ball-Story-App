import 'HomeStadium.dart';

class Athlete {
  final int code;
  final String name;
  final Team team;
  final AthleteType type;
  int? win;
  int? loose;
  int? hold;
  int? save;
  double? era;
  double? whip;
  double? hitAvg;
  int? rbi;
  int? hitCount;
  int? homeRunCount;
  String? imageUrl;

  Athlete({
    required this.code,
    required this.name,
    required this.team,
    required this.type,
    this.win,
    this.loose,
    this.hold,
    this.save,
    this.era,
    this.whip,
    this.hitAvg,
    this.rbi,
    this.hitCount,
    this.homeRunCount,
    this.imageUrl,
  });

  factory Athlete.fromJson(Map<String, dynamic> json) => Athlete(
    code: json['code'],
    name: json['name'],
    team: Team.fromString(json['team']),
    type: AthleteType.fromStr(json['type']),
    win: json['win'],
    loose: json['loose'],
    hold: json['hold'],
    save: json['save'],
    era: json['era'],
    whip: json['whip'],
    hitAvg: json['hitAvg'],
    rbi: json['rbi'],
    hitCount: json['hitCount'],
    homeRunCount: json['homeRunCount'],
    imageUrl: json['imageUrl']
  );

  @override
  String toString() {
    final b = StringBuffer('Athlete(')
      ..write('code: $code, ')
      ..write('name: $name, ')
      ..write('team: ${team.name}, ')
      ..write('type: ${type.name}');

    void add(String key, Object? value) {
      if (value != null) b.write(', $key: $value');
    }

    add('win', win);
    add('loose', loose);
    add('hold', hold);
    add('save', save);
    add('era', era);
    add('whip', whip);
    add('hitAvg', hitAvg);
    add('rbi', rbi);
    add('hitCount', hitCount);
    add('homeRunCount', homeRunCount);
    add('imageUrl', imageUrl);

    b.write(')');
    return b.toString();
  }
}


enum AthleteType {
  PITCHER("PITCHER", "투수"),
  HITTER("HITTER", "타자");

  final String name;
  final String label;
  const AthleteType(this.name, this.label);

  factory AthleteType.fromStr(String str) {
    return AthleteType.values.firstWhere((value) => value.name == str,
        orElse: () => throw Exception("$str : 존재하지 않는 선수 타입 값입니다."));
  }
}