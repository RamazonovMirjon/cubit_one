abstract class AuthState {
  AuthState();
}

class AuthInitial extends AuthState {
  AuthInitial();
}

class AuthLoading extends AuthState {
  AuthLoading();
}

class AuthComplete extends AuthState {
  var user;
  AuthComplete({required this.user});
}

class AuthError extends AuthState {
  String msg;
  AuthError({required this.msg});
}