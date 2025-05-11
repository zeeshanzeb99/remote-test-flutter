import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/businessLogic/all_product_bloc/all_products_bloc.dart';
import 'package:flutter_project/businessLogic/category_bloc/category_bloc.dart';
import 'package:flutter_project/helper/constant/asset_resources.dart';
import 'package:flutter_project/helper/constant/dimensions_resource.dart';
import 'package:flutter_project/helper/constant/string_resources.dart';
import 'package:flutter_project/presentation/screen/category/category_screen.dart';
import 'package:flutter_project/presentation/screen/favourite/favourite_screen.dart';
import 'package:flutter_project/presentation/screen/products/products_screen.dart';
import 'package:flutter_project/presentation/screen/profile/profile_screen.dart';
import '../../../businessLogic/favourites_bloc/favourite_bloc.dart';
import '../../../businessLogic/main_screen_bloc/main_screen_bloc.dart';
import '../../../helper/constant/colors_resource.dart';
import '../../widgets/nav_bar_item.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  late MainScreenBloc _mainScreenBloc;
  late AllProductsBloc _productBloc;
  late CategoryBloc _categoryBloc;
  final List<Widget> _screens = const [
    ProductsScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  final List<_NavItemData> _navItems = const [
    _NavItemData(AssetResources.product, StringResources.products),
    _NavItemData(AssetResources.categories, StringResources.categories),
    _NavItemData(AssetResources.heart, StringResources.favourites),
    _NavItemData(AssetResources.profile, StringResources.mittKonto),
  ];
  @override
  void initState() {
    super.initState();
    _mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
    _mainScreenBloc.add(UpdatePageIndexEvent(index: 0));
    _productBloc = BlocProvider.of<AllProductsBloc>(context);
    _productBloc.add(FetchProductsEvent(limit: 100));
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(FetchAllCategoriesEvent());
    context.read<FavouriteBloc>().add(GetFavItemEvent());}
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            height: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
              color: ColorsResource.COLOR_BLACK,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(DimensionsResource.D_6),
                topRight: Radius.circular(DimensionsResource.D_6),
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = constraints.maxWidth / _navItems.length;
                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 0),
                      curve: Curves.easeInOut,
                      left: state.currentIndex * itemWidth,
                      top: 0,
                      height: kBottomNavigationBarHeight,
                      width: itemWidth,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsResource.WHITE.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(DimensionsResource.D_5),
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(_navItems.length, (index) {
                        final item = _navItems[index];
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.read<MainScreenBloc>().add(UpdatePageIndexEvent(index: index));
                              if (index == 2) {
                                context.read<MainScreenBloc>().add(UpdatePageIndexEvent(index: index));
                                context.read<FavouriteBloc>().add(GetFavItemEvent());
                              }
                            },
                            child: SizedBox(
                              height: kBottomNavigationBarHeight,
                              child: Center(
                                child: NavBarItem(
                                  iconPath: item.iconPath,
                                  label: item.label,
                                  iconColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
class _NavItemData {
  final String iconPath;
  final String label;
  const _NavItemData(this.iconPath, this.label);
}