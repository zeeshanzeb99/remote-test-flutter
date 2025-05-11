import 'package:flutter/material.dart';
import 'package:flutter_project/helper/constant/asset_resources.dart';
import 'package:flutter_project/presentation/widgets/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/constant/colors_resource.dart';
import '../../helper/constant/dimensions_resource.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final VoidCallback? onTapIcon;
  final FocusNode? focusNode;
  final bool autoFocus;
  final EdgeInsets? margin;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.onTapIcon,
    this.focusNode,
    this.margin,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        margin: margin ?? EdgeInsets.zero,
        padding: EdgeInsets.symmetric(
            horizontal: DimensionsResource.D_16.w,
            vertical: DimensionsResource.D_1.h),
        decoration: BoxDecoration(
          color: ColorsResource.TRANSPARENT,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: ColorsResource.COLOR_BLACK),
        ),
        child: Row(
          children: [
            const SizedBox(child: SvgIconWidget(AssetResources.search)),
            Expanded(
              child: TextField(
                controller: controller,
                cursorColor: ColorsResource.COLOR_BLACK,
                cursorWidth: 1,
                cursorHeight: DimensionsResource.D_16.sp,
                focusNode: focusNode ?? FocusNode(),
                autofocus: autoFocus,
                onChanged: onChanged,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ColorsResource.COLOR_BLACK,
                      fontFamily: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: DimensionsResource.FONT_SIZE_MEDIUM.sp,
                      ).fontFamily,
                    ),
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: DimensionsResource.FONT_SIZE_3X_EXTRA_SMALL.sp,
                    ).fontFamily,
                  ),
                  hintText: hintText,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    top: DimensionsResource.D_9.h,
                    bottom: DimensionsResource.D_9.h,
                    left: DimensionsResource.D_10.w,
                    right: DimensionsResource.D_16.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
