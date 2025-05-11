import 'package:flutter/material.dart';
import 'package:flutter_project/dataProvider/models/response/favourite.dart';
import 'package:flutter_project/dataProvider/models/response/product.dart';
import 'package:flutter_project/helper/extensions/space_extensions.dart';
import 'package:flutter_project/presentation/widgets/text_view_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper/constant/asset_resources.dart';
import '../../helper/constant/colors_resource.dart';
import '../../helper/constant/dimensions_resource.dart';
import '../../helper/constant/string_resources.dart';
import '../../helper/theme/app_colors.dart';

class FavouriteWidget extends StatefulWidget {
  final Favourite? favourite;
  final Function()? onTap;
  const FavouriteWidget({
    super.key,
    this.favourite,
    this.onTap
  });
  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DimensionsResource.D_20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: DimensionsResource.D_88,
        decoration: BoxDecoration(
          color: ColorsResource.TRANSPARENT,
          borderRadius: BorderRadius.circular(DimensionsResource.D_5),
          border: Border.all(
            color: ColorsResource.COLOR_BLACK.withOpacity(0.2),
            width: DimensionsResource.D_1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(DimensionsResource.D_14),
              child: SizedBox(
                height: DimensionsResource.D_60,
                width: DimensionsResource.D_60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DimensionsResource.D_30),
                  child: Image.asset(
                    AssetResources.iphone,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: DimensionsResource.D_19),
                  CustomTextViewWidget(
                    text: widget.favourite?.title ?? "",
                    textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ColorsResource.COLOR_BLACK,
                      fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                      ).fontFamily,
                    ),
                  ),
                  SizedBox(height: DimensionsResource.D_2),
                  Row(
                    children: [
                      CustomTextViewWidget(
                        text: "\$${widget.favourite?.price.toString()}",
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ColorsResource.COLOR_BLACK,
                          fontFamily: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize:
                            DimensionsResource.FONT_SIZE_2X_EXTRA_SMALL.sp,
                          ).fontFamily,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: widget.onTap,
                        child: Padding(
                          padding: EdgeInsets.only(right: DimensionsResource.D_14),
                          child: SvgPicture.asset(AssetResources.heartFilled),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DimensionsResource.D_2),
                  Row(
                    children: [
                      CustomTextViewWidget(
                        text: widget.favourite?.rating.toString() ?? "",
                        textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ColorsResource.COLOR_BLACK,
                          fontFamily: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize:
                            DimensionsResource.FONT_SIZE_3X_EXTRA_SMALL.sp,
                          ).fontFamily,
                        ),
                      ),
                      SizedBox(width: DimensionsResource.D_3),
                      RatingBar(
                        itemSize: DimensionsResource.D_13,
                        initialRating: 4.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.zero,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star,
                              color: AppColors.yellowColor, size: 6),
                          half: Icon(Icons.star_half,
                              color: AppColors.yellowColor, size: 6),
                          empty: Icon(Icons.star_outline,
                              color: AppColors.yellowColor, size: 6),
                        ),
                        onRatingUpdate: (r) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
