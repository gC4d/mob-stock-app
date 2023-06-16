import 'package:bloc/bloc.dart';
import 'package:mob_storage_app/src/feature/group/group_state.dart';

class GroupController extends Cubit<GroupState> {
  final GroupController _groupController;
  GroupController(
    this._groupController,
  ) : super(const GroupState.initial());
}
