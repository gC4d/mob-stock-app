import 'package:match/match.dart';

part 'validation_state.g.dart';

@match
enum ValidationStateStatus {
  initial,
  loading,
  error,
  userLogged,
  userNotLogged,
  haveGroups,
  doNotHaveGroups,
}

class ValidationState {
  final ValidationStateStatus status;
  final String? errorMessage;
  const ValidationState({
    required this.status,
    this.errorMessage,
  });
  const ValidationState.initial()
      : status = ValidationStateStatus.initial,
        errorMessage = null;

  ValidationState copyWith({
    ValidationStateStatus? status,
    String? errorMessage,
  }) {
    return ValidationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
