mixin InputValidation {
  bool isUsernameValid(String nik) => nik.length >= 3 && nik.length <= 8;
  bool isPasswordValid(String password) => password.length >= 5;
}
