import 'dart:ffi';

import 'package:ballstory_app/model/HomeStadiumCreateError.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStadiumCreateErrorProvider =
    NotifierProvider<HomeStadiumCreateErrorNotifier, HomeStadiumCreateError>(
      HomeStadiumCreateErrorNotifier.new,
    );

class HomeStadiumCreateErrorNotifier extends Notifier<HomeStadiumCreateError> {
  HomeStadiumCreateError _errorModel = HomeStadiumCreateError();

  HomeStadiumCreateError get homeStadiumCreateError => _errorModel;

  void reset() {
    _errorModel = HomeStadiumCreateError();
  }

  @override
  HomeStadiumCreateError build() {
    return HomeStadiumCreateError();
  }

  String getNameErrorMsg() {
    return state.nameError ?? '';
  }

  String getTeamErrorMsg() {
    return state.teamError ?? '';
  }

  String getOwnerIdErrorMsg() {
    return state.ownerIdError ?? '';
  }

  void validateName(String value) {
    // TODO: 유효성 규칙 검증 추가
  }

  void setTeamErrorMsg(String value) {
    state.teamError = '$value : 유효하지 않은 프로야구 팀명입니다.';
  }

  void validateOwnerId(Long value) {
    // TODO: 유효성 규칙 검증 추가
  }
}
