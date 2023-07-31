import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:mob_storage_app/src/core/data/dto/group_dto.dart';
import 'package:mob_storage_app/src/core/repositories/group/group_repository.dart';
import 'package:mob_storage_app/src/feature/group/group_state.dart';

import '../../core/data/database/database.dart';
import '../../core/repositories/cryptography/cryptography_repository.dart';

class GroupController extends Cubit<GroupState> {
  final GroupRepository groupRepository;
  final CryptographyRepository crypto;
  late var groupDTO = GroupDTO(id: 0, description: '', key: '', password: '');

  GroupController({
    required this.groupRepository,
    required this.crypto,
  }) : super(const GroupState.initial());

  Future<void> getGroups() async {
    emit(state.copyWith(status: GroupStateStatus.loading));
    List<GroupData> groups = [];
    try {
      groups = await groupRepository.localGetAllGroups();
      emit(state.copyWith(
        groups: groups,
        status: GroupStateStatus.success,
      ));
    } catch (e) {
      log("Error in get user groups");
    }
  }

  Future<void> createGroups() async {
    emit(state.copyWith(status: GroupStateStatus.loading));
    try {
      if (groupDTO.description != '' && groupDTO.password != '') {
        groupDTO.key = await crypto.keyGenerator(groupDTO.description,
            groupDTO.password, DateTime.now(), "guilhermeacadorin@gmail.com");
        log(groupDTO.key);
        await groupRepository.syncCreateGroup(groupDTO);
      }
      emit(state.copyWith(status: GroupStateStatus.success));
    } catch (e) {
      log('error in groupController.createGroups()');
    }
  }
}
