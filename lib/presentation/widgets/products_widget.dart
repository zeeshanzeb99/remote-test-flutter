import 'package:flutter/material.dart';
import 'package:flutter_project/dataProvider/models/response/product.dart';
import 'package:flutter_project/helper/extensions/space_extensions.dart';
import 'package:flutter_project/presentation/widgets/text_view_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper/constant/colors_resource.dart';
import '../../helper/constant/dimensions_resource.dart';
import '../../helper/theme/app_colors.dart';

class ProductCard extends StatefulWidget {
  final Function()? onClickItem;
  final Product product;
  const ProductCard({
    this.onClickItem,
    required this.product,
    super.key,
  });
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DimensionsResource.D_20),
      child: InkWell(
        onTap: widget.onClickItem,
        child: Container(
          height: DimensionsResource.D_280,
          padding: EdgeInsets.symmetric(horizontal: DimensionsResource.D_15),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(DimensionsResource.D_10),
            border: Border.all(
              color: ColorsResource.COLOR_BLACK.withOpacity(0.2),
              width: DimensionsResource.D_1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: DimensionsResource.D_140,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      DimensionsResource.D_5),
                  child: Image.network(
                    widget.product.thumbnail ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: DimensionsResource.D_14),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextViewWidget(
                        align: TextAlign.left,
                        text: widget.product.title ?? '',
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ColorsResource.COLOR_BLACK,
                          fontFamily: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                          ).fontFamily,
                        ),
                      ),
                    ),
                  ),
                  CustomTextViewWidget(text: "\$${widget.product.price.toString()}",textStyle:
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorsResource.COLOR_BLACK,
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                    ).fontFamily,
                  )),
                ],
              ),
              const SizedBox(height: DimensionsResource.D_3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextViewWidget(text: widget.product.rating.toString(),textStyle:
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ColorsResource.COLOR_BLACK,
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                    ).fontFamily,
                  )),
                  const SizedBox(width: DimensionsResource.D_3),
                  RatingBar(
                      itemSize: DimensionsResource.D_13,
                      initialRating: widget.product.rating!,
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
              const SizedBox(height: DimensionsResource.D_10),
              CustomTextViewWidget(text: widget.product.brand != null ? "By ${widget.product.brand.toString()}" : "By ----",textStyle:
              Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ColorsResource.COLOR_BLACK.withOpacity(0.5),
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                ).fontFamily,
              )),
              const SizedBox(height: DimensionsResource.D_13),
              CustomTextViewWidget(text: "In ${widget.product.category.toString()}",textStyle:
              Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ColorsResource.COLOR_BLACK,
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                ).fontFamily,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
