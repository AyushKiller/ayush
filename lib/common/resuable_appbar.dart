import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/assets_constants.dart';

class ResuableAppbar extends StatelessWidget {
  const ResuableAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:SvgPicture.asset(AssetsConstants.twitterLogo),
    );
  }
}
