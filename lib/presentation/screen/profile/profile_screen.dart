import 'package:flutter/material.dart';
import 'package:flutter_project/helper/constant/asset_resources.dart';
import 'package:flutter_project/helper/constant/colors_resource.dart';
import 'package:flutter_project/helper/constant/dimensions_resource.dart';
import 'package:flutter_project/helper/constant/string_resources.dart';
import 'package:flutter_project/presentation/widgets/text_view_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(StringResources.mittKonto),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: DimensionsResource.D_20,right: DimensionsResource.D_20),
        child: Column(
          children: [
            SizedBox(height: DimensionsResource.D_25),
            Container(
              width: MediaQuery.of(context).size.width,
              height: DimensionsResource.D_88,
              decoration: BoxDecoration(
                color: ColorsResource.COLOR_BLACK,
                borderRadius: BorderRadius.circular(DimensionsResource.D_5), // corner radius
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(left: DimensionsResource.D_14),
                      child: SizedBox(
                        height: DimensionsResource.D_60,
                        width: DimensionsResource.D_60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(DimensionsResource.D_30),
                          child: Image.network(
                            AssetResources.dummyImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: DimensionsResource.D_19),
                      Padding(
                        padding:  EdgeInsets.only(left: DimensionsResource.D_14),
                        child: CustomTextViewWidget(text: StringResources.mittKonto,textStyle:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ColorsResource.WHITE,
                          fontFamily: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
                          ).fontFamily,
                        )
                        )
                      ),
                      SizedBox(height: DimensionsResource.D_2),
                      Padding(
                          padding:  EdgeInsets.only(left: DimensionsResource.D_14),
                          child: CustomTextViewWidget(text: StringResources.email,textStyle:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ColorsResource.WHITE,
                            fontFamily: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: DimensionsResource.FONT_SIZE_3X_EXTRA_SMALL.sp,
                            ).fontFamily,
                          )
                          )
                      ),
                      SizedBox(height: DimensionsResource.D_2),
                      Padding(
                          padding:  EdgeInsets.only(left: DimensionsResource.D_14),
                          child: CustomTextViewWidget(text: StringResources.phNo,textStyle:
                          Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ColorsResource.WHITE,
                            fontFamily: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: DimensionsResource.FONT_SIZE_3X_EXTRA_SMALL.sp,
                            ).fontFamily,
                          )
                          )
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: DimensionsResource.D_50),
            _buildRow(StringResources.settings, AssetResources.settings),
            SizedBox(height: DimensionsResource.D_30),
            _buildRow(StringResources.cash, AssetResources.cash),
            SizedBox(height: DimensionsResource.D_30),
            _buildRow(StringResources.support, AssetResources.support),
          ],
        ),
      ),
    );
  }
  Widget _buildRow(String text, String image) {
    return  Padding(
      padding: const EdgeInsets.only(left: DimensionsResource.D_20),
      child: Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(width: DimensionsResource.D_20),
          CustomTextViewWidget(text: text,textStyle:
          Theme.of(context).textTheme.labelMedium?.copyWith(
            color: ColorsResource.DARK_BLACK,
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: DimensionsResource.FONT_SIZE_SMALL.sp,
            ).fontFamily,
          )
          )
        ],
      ),
    );
  }
}
