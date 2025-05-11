import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/businessLogic/favourites_bloc/favourite_bloc.dart';
import 'package:flutter_project/helper/constant/string_resources.dart';
import 'package:flutter_project/presentation/widgets/favourite_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helper/constant/colors_resource.dart';
import '../../../helper/constant/dimensions_resource.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/text_view_widget.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
    return BlocConsumer<FavouriteBloc, FavouriteState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResources.favourites),
      ),
      body: Padding(
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
                    context.read<FavouriteBloc>().add(SearchFav(title: searchController.text));
                  }
                  if (value.isEmpty) {
                    _searchFocusNode.unfocus();
                    Future.delayed(
                        const Duration(seconds: DimensionsResource.D1));
                    context.read<FavouriteBloc>().add(GetFavItemEvent());
                  }
                });
              },
            ),
            const SizedBox(height: DimensionsResource.D_14),
            Padding(
              padding: const EdgeInsets.only(left: DimensionsResource.D_10),
              child: CustomTextViewWidget(text: "${state.favourite.length} ${StringResources.result_found}",textStyle:
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
                  itemCount: state.favourite.length,
                  itemBuilder: (c, i) {
                    return FavouriteWidget(favourite: state.favourite[i],
                    onTap: (){
                      context.read<FavouriteBloc>().add(RemoveFavItemEvent(state.favourite[i].id ?? 0));
                    });
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
