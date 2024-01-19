/// Custom exception class to handle various Firebase Authentication related errors.
class TFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes on error code.
  TFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'invalid-credential':
        return 'The email or password provided is invalid. Please enter a valid credential.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has beed disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exist':
        return 'The email address already exist. Please use a different email.';
      case 'provide-already-linked':
        return 'The account is already linked with another provider';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      default:
        return 'An unexpected Firebase Authentication error occured. Please try again. ($code)';
    }
  }
}
