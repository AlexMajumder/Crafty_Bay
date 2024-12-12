import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key, this.width, this.height, this.boxFit,
  });

  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogoSvg,
      width: width ?? 120,
      height: height ?? 120,
      fit: boxFit ?? BoxFit.scaleDown,
    );
  }
}
