mixin InputValidation {
  bool isUsernameValid(String nik) => nik.length >= 3 && nik.length <= 20;
  bool isPasswordValid(String password) => password.length >= 5;
}
