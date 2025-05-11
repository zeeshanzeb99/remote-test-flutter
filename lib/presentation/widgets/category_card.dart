import 'package:flutter/material.dart';
import 'package:flutter_project/helper/constant/asset_resources.dart';
import 'package:flutter_project/presentation/widgets/text_view_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../dataProvider/models/response/category.dart';
import '../../helper/constant/colors_resource.dart';
import '../../helper/constant/dimensions_resource.dart';
import '../router/routes.dart';
class CategoryCard extends StatefulWidget {
  final Function()? onClickItem;
  final Category category;
  const CategoryCard({
    this.onClickItem,
    required this.category,
    super.key,
  });
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DimensionsResource.D_10),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, CATEGORY_DETAILS_SCREEN,
              arguments: widget.category);
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color:Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(AssetResources.DUMMY_IMAGE_STRING),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: DimensionsResource.D_14,
              left: DimensionsResource.D_10,
              child: CustomTextViewWidget(text: widget.category.slug.toString(),textStyle:
              Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ColorsResource.WHITE,
                fontFamily: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: DimensionsResource.FONT_SIZE_1X_EXTRA_SMALL.sp,
                ).fontFamily,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
