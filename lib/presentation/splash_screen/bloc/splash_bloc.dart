import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:snehal_s_application64/presentation/splash_screen/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {}
}
