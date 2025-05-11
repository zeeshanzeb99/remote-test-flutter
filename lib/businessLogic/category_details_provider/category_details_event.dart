
part of 'category_details_bloc.dart';


abstract class CategoryDetailsEvent {}

class FetchCategoryProductsEvent extends CategoryDetailsEvent {
  final Category category;
  FetchCategoryProductsEvent({required this.category});

}
class SearchCategory extends CategoryDetailsEvent {
  final String title;

  SearchCategory({required this.title});
}
