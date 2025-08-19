class HomeStadiumCreateError {
  String? _nameError;
  String? _teamError;
  String? _ownerIdError;

  set nameError(String? value) {
    _nameError = value;
  }

  set teamError(String? value) {
    _teamError = value;
  }

  set ownerIdError(String? value) {
    _ownerIdError = value;
  }

  String? get nameError => _nameError;
  String? get teamError => _teamError;
  String? get ownerIdError => _ownerIdError;
}
