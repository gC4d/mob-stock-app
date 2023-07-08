import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mob_storage_app/src/core/repositories/group/group_repository.dart';
import 'package:mob_storage_app/src/feature/group/group_state.dart';

import '../../core/data/database/database.dart';

class GroupController extends Cubit<GroupState> {
  final GroupRepository _groupController;
  GroupController(
    this._groupController,
  ) : super(const GroupState.initial());

  Future<void> getGroups() async {
    emit(state.copyWith(status: GroupStateStatus.loading));
    List<GroupData> groups = [];
    try {
      groups = await _groupController.localGetAllGroups();
      emit(state.copyWith(
        groups: groups,
        status: GroupStateStatus.success,
      ));
    } catch (e) {
      log("Error in get user groups");
    }
  }
}
