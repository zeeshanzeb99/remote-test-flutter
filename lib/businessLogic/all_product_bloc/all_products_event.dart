
part of 'all_products_bloc.dart';

abstract class AllProductsEvent{}

class FetchProductsEvent extends AllProductsEvent {
  final int? limit;
  final String? title;

  FetchProductsEvent({this.limit, this.title});
}

class SearchProducts extends AllProductsEvent {
  final String title;

  SearchProducts({required this.title});
}