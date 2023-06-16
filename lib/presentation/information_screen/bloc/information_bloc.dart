import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:snehal_s_application64/presentation/information_screen/models/information_model.dart';
part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  InformationBloc(InformationState initialState) : super(initialState) {
    on<InformationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    InformationInitialEvent event,
    Emitter<InformationState> emit,
  ) async {
    emit(state.copyWith(
        groupController: TextEditingController(),
        dateController: TextEditingController(),
        countryController: TextEditingController(),
        groupOneController: TextEditingController()));
  }
}
