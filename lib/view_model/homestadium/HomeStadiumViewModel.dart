import 'dart:ffi';

import 'package:ballstory_app/model/HomeStadium.dart';
import 'package:ballstory_app/view_model/homestadium/HomeStadiumErrorViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../BaseViewModel.dart';

final homeStadiumNotifierProvider =
    NotifierProvider<HomeStadiumNotifier, HomeStadium>(HomeStadiumNotifier.new);

class HomeStadiumNotifier extends Notifier<HomeStadium>
    implements BaseViewModel {
  @override
  HomeStadium build() {
    return HomeStadium.init();
  }

  @override
  void reset() {
    state.reset();
  }

  void setName(String value) {
    ref.read(homeStadiumCreateErrorProvider.notifier).validateName(value);
    state = state.copyWith(name: value);
  }

  void setTeam(Team value) {
    try {
      state = state.copyWith(team: value);
    } catch (_) {
      ref.read(homeStadiumCreateErrorProvider.notifier).setTeamErrorMsg(value.toString());
    }
  }

  void setOwnerId(Long value) {
    ref.read(homeStadiumCreateErrorProvider.notifier).validateOwnerId(value);
    state = state.copyWith(ownerId: value);
  }

  Future<AsyncValue<void>> validateDuplicatedName() async {
    // TODO: 홈구장명 중복 체크 로직 구현
    return AsyncValue.data(null);
  }
}
