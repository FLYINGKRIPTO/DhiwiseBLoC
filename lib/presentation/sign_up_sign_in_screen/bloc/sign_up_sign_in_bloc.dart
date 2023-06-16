import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:snehal_s_application64/presentation/sign_up_sign_in_screen/models/sign_up_sign_in_model.dart';
import 'package:snehal_s_application64/data/models/register/post_register_resp.dart';
import 'package:snehal_s_application64/data/models/register/post_register_req.dart';
import 'dart:async';
import 'package:snehal_s_application64/data/repository/repository.dart';
part 'sign_up_sign_in_event.dart';
part 'sign_up_sign_in_state.dart';

class SignUpSignInBloc extends Bloc<SignUpSignInEvent, SignUpSignInState> {
  SignUpSignInBloc(SignUpSignInState initialState) : super(initialState) {
    on<SignUpSignInInitialEvent>(_onInitialize);
    on<CreateRegisterEvent>(_callCreateRegister);
  }

  final _repository = Repository();

  var postRegisterResp = PostRegisterResp();

  _onInitialize(
    SignUpSignInInitialEvent event,
    Emitter<SignUpSignInState> emit,
  ) async {}
  FutureOr<void> _callCreateRegister(
    CreateRegisterEvent event,
    Emitter<SignUpSignInState> emit,
  ) async {
    var postRegisterReq = PostRegisterReq();
    await _repository.createRegister(
      headers: {
        'Content-Type': 'application/json',
      },
      requestData: postRegisterReq.toJson(),
    ).then((value) async {
      postRegisterResp = value;
      _onCreateRegisterSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onCreateRegisterError();
    });
  }

  void _onCreateRegisterSuccess(
    PostRegisterResp resp,
    Emitter<SignUpSignInState> emit,
  ) {}
  void _onCreateRegisterError() {
    //implement error method body...
  }
}
