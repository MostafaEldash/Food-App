part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationFailedState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {}
