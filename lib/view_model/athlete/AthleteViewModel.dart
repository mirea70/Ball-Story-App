import 'dart:async';

import 'package:ballstory_app/model/Athlete.dart';
import 'package:ballstory_app/model/HomeStadium.dart';
import 'package:ballstory_app/repository/AthleteRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../homestadium/HomeStadiumViewModel.dart';

final athleteAsyncNotifierProvider =
AsyncNotifierProvider<AthleteAsyncNotifier, List<Athlete>>(() {
  return AthleteAsyncNotifier();
});

class AthleteAsyncNotifier extends AsyncNotifier<List<Athlete>> {
  @override
  FutureOr<List<Athlete>> build() {
    return _fetchAthletes();
  }


  Future<List<Athlete>> _fetchAthletes() async {
    Team? team = ref.read(homeStadiumNotifierProvider.notifier).getTeam();
    if(team == null) {
      return [];
    }

    return ref.read(athleteRepositoryProvider).findAllByTeam(team);
  }
}