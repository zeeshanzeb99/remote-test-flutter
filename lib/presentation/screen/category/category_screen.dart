import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/businessLogic/category_bloc/category_bloc.dart';
import 'package:flutter_project/helper/constant/string_resources.dart';
import 'package:flutter_project/helper/util/api_status.dart';
import 'package:flutter_project/presentation/widgets/category_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helper/constant/colors_resource.dart';
import '../../../helper/constant/dimensions_resource.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/text_view_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  Timer? _debounce;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (c,s){},
        builder: (c,state){
        return Scaffold(
          appBar: AppBar(
            title: Text(StringResources.categories),
          ),
          body: state.apiRequestStatus is ApiRequestStatusLoading ?
          Center(child: CircularProgressIndicator(color: ColorsResource.COLOR_BLACK)
          )
            :
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
                        context.read<CategoryBloc>().add(SearchCat(title: searchController.text));

                      }
                      if (value.isEmpty) {
                        _searchFocusNode.unfocus();
                        Future.delayed(
                            const Duration(seconds: DimensionsResource.D1));
                        context.read<CategoryBloc>().add(FetchAllCategoriesEvent());
                      }
                    });
                  },
                ),
                const SizedBox(height: DimensionsResource.D_14),
                Padding(
                  padding: const EdgeInsets.only(left: DimensionsResource.D_10),
                  child: CustomTextViewWidget(text: "${state.categories.length.toString()} ${StringResources.result_found}",textStyle:
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
                    child: GridView.builder(
                      itemCount: state.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return CategoryCard(category: category);
                      },
                    ),
                  ),
                ]
            ),
          ),
        );

        }, );
  }
}
