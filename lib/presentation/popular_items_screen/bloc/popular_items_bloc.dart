import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/popularitems_item_model.dart';
import 'package:snehal_s_application64/presentation/popular_items_screen/models/popular_items_model.dart';
import 'package:snehal_s_application64/data/models/list/post_list_resp.dart';
import 'package:snehal_s_application64/data/models/list/post_list_req.dart';
import 'dart:async';
import 'package:snehal_s_application64/data/repository/repository.dart';
part 'popular_items_event.dart';
part 'popular_items_state.dart';

class PopularItemsBloc extends Bloc<PopularItemsEvent, PopularItemsState> {
  PopularItemsBloc(PopularItemsState initialState) : super(initialState) {
    on<PopularItemsInitialEvent>(_onInitialize);
    on<CreateListEvent>(_callCreateList);
  }

  final _repository = Repository();

  var postListResp = PostListResp();

  _onInitialize(
    PopularItemsInitialEvent event,
    Emitter<PopularItemsState> emit,
  ) async {
    emit(state.copyWith(
        popularItemsModelObj: state.popularItemsModelObj
            ?.copyWith(popularitemsItemList: fillPopularitemsItemList())));
    add(
      CreateListEvent(),
    );
  }

  List<PopularitemsItemModel> fillPopularitemsItemList() {
    return List.generate(4, (index) => PopularitemsItemModel());
  }

  FutureOr<void> _callCreateList(
    CreateListEvent event,
    Emitter<PopularItemsState> emit,
  ) async {
    var postListReq = PostListReq();
    await _repository.createList(
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNjUyZjdjMTI0ODc2MDAxNTVjYzY0ZCIsImVtYWlsIjoiUHJpc2NpbGxhX01vaHJAeWFob28uY29tIiwiaWF0IjoxNjM0MDIyNDM4LCJleHAiOjE2MzQ2MjI0Mzh9.YYcCfVOnPA7ZFc-cV90a33_Hycddj-Xtt5kI6IRukxQ',
      },
      requestData: postListReq.toJson(),
    ).then((value) async {
      postListResp = value;
      _onCreateListSuccess(value, emit);
    }).onError((error, stackTrace) {
      //implement error call
      _onCreateListError();
    });
  }

  void _onCreateListSuccess(
    PostListResp resp,
    Emitter<PopularItemsState> emit,
  ) {}
  void _onCreateListError() {
    //implement error method body...
  }
}
