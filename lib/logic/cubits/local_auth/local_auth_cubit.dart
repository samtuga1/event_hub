import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:meta/meta.dart';
part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  final LocalAuthentication _auth = LocalAuthentication();

  LocalAuthCubit() : super(LocalAuthInitial());
  Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<void> authenticate() async {
    try {
      if (!await _canAuthenticate()) emit(LocalAuthSet(false));
      bool result = await _auth.authenticate(
        localizedReason: 'Prevent others from viewing your events',
        authMessages: const [
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
      emit(LocalAuthSet(result));
    } catch (err) {
      print(err);
      false;
    }
  }

  @override
  void onChange(Change<LocalAuthState> change) {
    super.onChange(change);
    log(change.currentState.toString());
  }
}
