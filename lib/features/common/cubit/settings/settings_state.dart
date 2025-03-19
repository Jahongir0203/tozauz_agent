// part of 'settings_cubit.dart';
//
// class SettingsState extends Equatable {
//   const SettingsState({
//     this.status = Status.UNKNOWN,
//     this.failure = const UnknownFailure(),
//     this.language = 'uz',
//     this.onBoard = false,
//   });
//
//   final Status status;
//   final Failure failure;
//   final String language;
//   final bool onBoard;
//
//   SettingsState copyWith({
//     Status? status,
//     Failure? failure,
//     String? language,
//     bool? onBoard,
//   }) {
//     return SettingsState(
//         status: status ?? this.status,
//         failure: failure ?? this.failure,
//         language: language ?? this.language,
//         onBoard: onBoard ?? this.onBoard);
//   }
//
//   @override
//   List<Object> get props => [
//         status,
//         failure,
//         language,
//         onBoard,
//       ];
// }
