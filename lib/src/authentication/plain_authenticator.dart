part of "../authentication.dart";

class PlainAuthenticator implements Authenticator {
  final String userName;
  final String password;

  /// Create a new [PlainAuthenticator] with the specified [userName] and [password]
  const PlainAuthenticator(this.userName, this.password);

  /// Get the class of this authenticator
  @override
  String get saslType => "PLAIN";

  /// Process the [challenge] sent by the server and return a [String] response
  @override
  String answerChallenge(String? challenge) {
    StringBuffer sb = StringBuffer()
      ..writeCharCode(0)
      ..write(userName)
      ..writeCharCode(0)
      ..write(password);

    return sb.toString();
  }
}
