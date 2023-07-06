part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {}

class LoginLoadingState extends LoginState {}
