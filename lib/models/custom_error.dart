import 'package:equatable/equatable.dart' show Equatable;

class CustomError extends Equatable {
  final String errorMessage;

  const CustomError({
    this.errorMessage = '',
  });

  @override
  String toString() => 'CustomError(errorMessage: $errorMessage)';

  @override
  List<Object?> get props => [errorMessage];
}
