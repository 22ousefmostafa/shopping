import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository = AuthRepository();
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      await repository.signIn(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUp(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(AuthLoading());
    try {
      await repository.signUp(
        name: name,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> sendResetCode(String email) async {
    emit(AuthLoading());
    try {
      await repository.sendResetCode(email: email);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String code) async {
    emit(AuthLoading());
    try {
      await repository.verifyOtp(email: email, code: code);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword(
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(AuthLoading());
    try {
      await repository.resetPassword(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
