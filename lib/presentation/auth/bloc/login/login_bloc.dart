import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:member_humic/data/datasources/auth_remote_datasource.dart';
import 'package:member_humic/data/models/respons/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LoginBloc(this.authRemoteDatasource) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      print("Login event received");
      emit(const _Loading());
      final response = await authRemoteDatasource.login(
        event.username,
        event.password,
      );
      response.fold(
        (l) {
          print("Login failed: $l");
          emit(_Error(l));
        },
        (r) {
          print("Login successful");
          emit(_Success(r));
        },
      );
    });

  }
}
