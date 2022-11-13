part of 'local_auth_cubit.dart';

@immutable
abstract class LocalAuthState {}

class LocalAuthInitial extends LocalAuthState {}

class LocalAuthSet extends LocalAuthState {
  final bool? isAuthenticated;

  LocalAuthSet(this.isAuthenticated);
}
