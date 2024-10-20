class ResponseFailure {
  final String message;

  const ResponseFailure._(this.message);

  /// Unauthorized User Failure
  const ResponseFailure.unauthorizedUser() : this._('Unauthorized: Please log in.');

  /// Custom Failure with message
  const ResponseFailure.customFailure(String message) : this._(message);

  /// Try Again Failure
  const ResponseFailure.tryAgain() : this._('Something went wrong. Please try again.');

  /// Connectivity Issue Failure
  const ResponseFailure.checkYourConnectivity(String message)
      : this._('Connectivity Issue: $message');
}
