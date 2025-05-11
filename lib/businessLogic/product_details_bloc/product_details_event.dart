
part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent {}

class FetchProductDetailsEvent extends ProductDetailsEvent{
  final int id;
  FetchProductDetailsEvent({required this.id});
}

class SetFavourite extends ProductDetailsEvent{
  final bool value;
  SetFavourite({required this.value});
}