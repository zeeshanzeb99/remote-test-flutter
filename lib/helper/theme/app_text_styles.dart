import 'package:flutter/material.dart';
import 'package:flutter_project/helper/constant/dimensions_resource.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


class AppTextStyles {



  static TextStyle titleStyle = GoogleFonts.playfairDisplay(
    fontSize: DimensionsResource.D_24,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600
  );

  static TextStyle productTitle = GoogleFonts.poppins(
      fontSize: DimensionsResource.D_18,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600
  );

  static TextStyle productHeading = GoogleFonts.poppins(
      fontSize: DimensionsResource.D_12,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w600
  );

  static TextStyle productSubheading = GoogleFonts.poppins(
      fontSize: DimensionsResource.D_10,
      color: AppColors.blackColor,
      fontWeight: FontWeight.w400
  );


}