import 'package:match/match.dart';

part 'validation_state.g.dart';

@match
enum ValidationStateStatus {
  initial,
  loading,
  error,
  sucess,
}

class ValidationState {
  final ValidationStateStatus status;
  final bool hasGroups;
  final bool isLogged;
  final bool groupSelected;
  final String? errorMessage;
  const ValidationState({
    required this.hasGroups, 
    required this.isLogged, 
    required this.groupSelected,
    required this.status,
    this.errorMessage,
  });
  const ValidationState.initial()
      : status = ValidationStateStatus.initial,
        isLogged = false,
        hasGroups = false,
        groupSelected =  false,
        errorMessage = null;

  ValidationState copyWith({
    ValidationStateStatus? status,
    bool? isLogged,
    bool? hasGroups,
    bool? groupSelected,
    String? errorMessage,
  }) {
    return ValidationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage, 
      groupSelected: groupSelected ?? this.groupSelected,
      hasGroups: hasGroups ?? this.hasGroups,
      isLogged: isLogged ?? this.isLogged,
    );
  }
}
