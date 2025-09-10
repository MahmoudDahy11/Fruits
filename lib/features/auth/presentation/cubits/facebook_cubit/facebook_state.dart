part of 'facebook_cubit.dart';

@immutable
sealed class FacebookState extends Equatable {
  const FacebookState();

  @override
  List<Object?> get props => [];
}

final class FacebookInitial extends FacebookState {}

final class FacebookLoading extends FacebookState {}

final class FacebookSuccess extends FacebookState {
  final UserEntity user;
  const FacebookSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

final class FacebookFailure extends FacebookState {
  final String errMessage;
  const FacebookFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}
