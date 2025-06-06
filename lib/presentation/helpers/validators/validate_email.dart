
/// Email Validator
String? validateEmail(String? email) {
  if (email == null) {
    return 'Please Enter an Email';
  }

  if (RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email)) {
    return null;
  }

  return 'Invalid Email';
}

/// Phone Number Validator
String? validatePassword(String? value) {
  RegExp regex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value == null ||value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else {
      return null;
    }
  }
}
String? validateName(String? name) {
  if (name == null || name.isEmpty) return 'Please Enter A Name';

  if (name.length < 4) return 'Please Enter Your Full Name';

  return null;
}
String? validateDescription(String? value) {
  if (value == null || value.trim().isEmpty) return 'Description can\'t be empty.';
  return null;
}