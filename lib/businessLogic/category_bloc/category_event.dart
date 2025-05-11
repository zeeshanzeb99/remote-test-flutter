
part of 'category_bloc.dart';


abstract class CategoryEvent {}

class FetchAllCategoriesEvent extends CategoryEvent {}


class SearchCat extends CategoryEvent {
  final String title;

  SearchCat({required this.title});
}