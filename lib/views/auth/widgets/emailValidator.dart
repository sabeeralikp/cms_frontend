String? emailValidator(value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                if (isValidEmail(value) != null) {
                  return 'Please enter a valid email address';
                }
                return null;
              }

  //Email Validation
  String? isValidEmail(String value) {
    // Use a regular expression pattern to validate email addresses
    final pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }