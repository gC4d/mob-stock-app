import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../core/data/database/database.dart';

part 'group_state.g.dart';

@match
enum GroupStateStatus {
  initial,
  loading,
  success,
  error,
  notLogged,
}

class GroupState extends Equatable {
  final GroupStateStatus status;
  final List<GroupData> groups;
  final String? errorMessage;

  const GroupState({
    required this.status,
    required this.groups,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, errorMessage, groups];

  const GroupState.initial()
      : status = GroupStateStatus.initial,
        groups = const [],
        errorMessage = null;
  
  

  GroupState copyWith({
    GroupStateStatus? status,
    List<GroupData>? stocks,
    String? errorMessage,
  }) {
    return GroupState(
      status: status ?? this.status,
      groups: groups ?? this.groups,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
