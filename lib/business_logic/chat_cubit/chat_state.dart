part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoadingState extends ChatState {}

class ChatSuccessState extends ChatState {}

class ChatErrorState extends ChatState {}
