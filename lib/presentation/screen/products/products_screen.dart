import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/businessLogic/all_product_bloc/all_products_bloc.dart';
import 'package:flutter_project/helper/constant/colors_resource.dart';
import 'package:flutter_project/helper/constant/constants_resource.dart';
import 'package:flutter_project/helper/constant/dimensions_resource.dart';
import 'package:flutter_project/helper/constant/string_resources.dart';
import 'package:flutter_project/helper/util/api_status.dart';
import 'package:flutter_project/presentation/router/routes.dart';
import 'package:flutter_project/presentation/widgets/custom_search_bar.dart';
import 'package:flutter_project/presentation/widgets/products_widget.dart';
import 'package:flutter_project/presentation/widgets/text_view_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  Timer? _debounce;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    _searchFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllProductsBloc, AllProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(StringResources.products),
          ),
          body: state.apiRequestStatus is ApiRequestStatusLoading ?
            Center(child: CircularProgressIndicator(color: ColorsResource.COLOR_BLACK)
        ):
            Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: DimensionsResource.D_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: DimensionsResource.D_10),
                CustomSearchBar(controller: searchController, hintText: StringResources.search,
                  onChanged: (value) {
                    if (_debounce?.isActive ?? false) {
                      _debounce!.cancel();
                    }
                    _debounce = Timer(
                        Duration(
                            milliseconds: DimensionsResource.D200), () {
                      if (value != null && value.isNotEmpty) {
                        _searchFocusNode.unfocus();
                        Future.delayed(
                            const Duration(seconds: DimensionsResource.D1));
                        context.read<AllProductsBloc>().add(SearchProducts(title: searchController.text));
                      }
                      if (value.isEmpty) {
                        _searchFocusNode.unfocus();
                        Future.delayed(
                            const Duration(seconds: DimensionsResource.D1));
                        context.read<AllProductsBloc>().add(FetchProductsEvent(limit: ConstantsResource.itemLimit));
                      }
                    });
                  },
                ),
                const SizedBox(height: DimensionsResource.D_14),
                Padding(
                  padding: const EdgeInsets.only(left: DimensionsResource.D_10),
                  child: CustomTextViewWidget(text: "${state.products.length.toString()} ${StringResources.result_found}",textStyle:
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorsResource.COLOR_BLACK.withOpacity(0.3),
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: DimensionsResource.FONT_SIZE_3X_EXTRA_SMALL.sp,
                    ).fontFamily,
                  )),
                ),
                const SizedBox(height: DimensionsResource.D_14),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: state.products.length,
                      itemBuilder: (c, i) {
                        final product = state.products[i];
                        return ProductCard(onClickItem: (){
                          Navigator.pushNamed(context, PRODUCT_DETAILS_SCREEN,
                              arguments: product.id);
                        }, product: product);
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
