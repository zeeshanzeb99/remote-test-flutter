import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/helper/constant/asset_resources.dart';
import 'package:flutter_project/helper/constant/colors_resource.dart';
import 'package:flutter_project/helper/theme/app_text_styles.dart';
import 'package:flutter_project/presentation/widgets/text_view_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../businessLogic/product_details_bloc/product_details_bloc.dart';
import '../../../helper/constant/dimensions_resource.dart';
import '../../../helper/constant/string_resources.dart';
import '../../../helper/theme/app_colors.dart';
import '../../../helper/util/api_status.dart';
class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDetailsBloc _productDetailsBloc;

  @override
  void initState() {
    super.initState();
    _productDetailsBloc = BlocProvider.of<ProductDetailsBloc>(context);
    _productDetailsBloc.add(FetchProductDetailsEvent(id: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.apiRequestStatus is ApiRequestStatusLoading) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator(color: ColorsResource.COLOR_BLACK)),
          );
        }
        if (state.apiRequestStatus is ApiRequestStatusFailure) {
          return const Scaffold(
            body: Center(child: Text('Something went wrong')),
          );
        }

        if (state.apiRequestStatus is ApiRequestStatusSuccess && state.product != null) {
          final product = state.product!;
          return Scaffold(
            appBar: AppBar(
              title: Text(StringResources.product_details),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: EdgeInsets.zero, // Removes default padding
                icon: SvgPicture.asset(
                  AssetResources.leftChevron,
                  width: DimensionsResource.D_16, // Adjust size here
                  height: DimensionsResource.D_16,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(DimensionsResource.D_16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: DimensionsResource.D_10,
                  children: [
                    Container(
                      height: DimensionsResource.D_200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(product.thumbnail ?? ''),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                     SizedBox(height: DimensionsResource.D_15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(StringResources.product_details, style: AppTextStyles.productTitle,),
                        InkWell(
                          onTap: (){
                            _productDetailsBloc.add(SetFavourite(value: !state.isFavourite));
                          },
                          child: SvgPicture.asset(
                            state.isFavourite ? AssetResources.heartFilled :AssetResources.heart_border,
                            height: DimensionsResource.D_20,
                          ),
                        ),
                        
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextViewWidget(text: StringResources.name,textStyle: AppTextStyles.productHeading),
                        const SizedBox(width: DimensionsResource.D_6),
                        CustomTextViewWidget(text: product.title ?? "",textStyle: AppTextStyles.productSubheading),
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextViewWidget(text: StringResources.price,textStyle: AppTextStyles.productHeading),
                        const SizedBox(width: DimensionsResource.D_6),
                        CustomTextViewWidget(text: '\$${product.price.toString()}',textStyle: AppTextStyles.productSubheading),
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextViewWidget(text: StringResources.category,textStyle: AppTextStyles.productHeading),
                        const SizedBox(width: DimensionsResource.D_6),
                        CustomTextViewWidget(text: product.category.toString(),textStyle: AppTextStyles.productSubheading),
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextViewWidget(text: StringResources.brand,textStyle: AppTextStyles.productHeading),
                        const SizedBox(width: DimensionsResource.D_6),
                        CustomTextViewWidget(text: product.brand.toString(),textStyle: AppTextStyles.productSubheading),
                      ],
                    ),
                    Row(
                      children: [
                        CustomTextViewWidget(text: StringResources.rating,textStyle: AppTextStyles.productHeading),
                        const SizedBox(width: DimensionsResource.D_6),
                        RatingBar(
                    itemSize: DimensionsResource.D_13,
                    initialRating: product.rating!,
                    minRating: DimensionsResource.D_1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: 0),
                    ratingWidget: RatingWidget(
                      full: Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                          size: 6
                      ),
                      half: Icon(
                        Icons.star_half,
                        color: AppColors.yellowColor,
                        size: 6,
                      ),
                      empty: Icon(
                        Icons.star_outline,
                        color: AppColors.yellowColor,
                        size: 6,
                      ),
                    ),
                    onRatingUpdate: (r) {}),
                      ],
                    ),
                    Text(StringResources.description,
                      style: AppTextStyles.productHeading,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: DimensionsResource.D_10),
                      child: Text(
                        product.description ?? "",
                        style: AppTextStyles.productSubheading,
                      ),
                    ),

                    Text(
                      StringResources.gallery,
                      style: AppTextStyles.productHeading,
                    ),

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(), // disables internal scrolling
                      shrinkWrap: true,
                      itemCount: product.images!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        final image = product.images![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            image: DecorationImage(image: NetworkImage(image), fit: BoxFit.contain)
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: Text('Loading...')),
        );
      },
    );
  }

  Widget text(BuildContext context, String title, String subtitle) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyles.productHeading,
          ),
          TextSpan(
            text: subtitle,
            style: AppTextStyles.productSubheading,
          ),
        ],
      ),
    );
  }
}
