import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../helper/constant/colors_resource.dart';
import '../../helper/constant/dimensions_resource.dart';

class SvgIconWidget extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;
  final BoxFit? fit;
  final Function()? onClick;
  final bool isExpanded;

  const SvgIconWidget(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.fit,
    this.onClick,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsResource.TRANSPARENT,
      child: InkWell(
        onTap: onClick,
        highlightColor: ColorsResource.TRANSPARENT,
        hoverColor: ColorsResource.TRANSPARENT,
        splashColor: ColorsResource.TRANSPARENT,
        splashFactory: NoSplash.splashFactory,
        child: Padding(
          padding: isExpanded
              ? EdgeInsets.all(DimensionsResource.D_8.h)
              : EdgeInsets.zero,
          child: SvgPicture.asset(
            icon,
            height: size,
            width: size,
            fit: fit ?? BoxFit.contain,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}
