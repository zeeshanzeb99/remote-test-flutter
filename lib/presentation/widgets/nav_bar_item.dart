import 'package:flutter/material.dart';
import 'package:flutter_project/helper/constant/dimensions_resource.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color iconColor;
  const NavBarItem({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          color: iconColor,
          width: DimensionsResource.D_24,
          height: DimensionsResource.D_24,
        ),
        const SizedBox(height: DimensionsResource.D_4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: DimensionsResource.D_10,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
