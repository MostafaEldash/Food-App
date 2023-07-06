part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderSuccessState extends OrderState {}

class OrderFailedState extends OrderState {}

class OrderLoadingState extends OrderState {}

class TotalPriceChangedState extends OrderState {}

class QuantityChanged extends OrderState {}
