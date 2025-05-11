import 'package:flutter/material.dart';
import 'package:flutter_project/helper/constant/asset_resources.dart';
import 'package:flutter_project/presentation/router/routes.dart';
import '../../../helper/constant/constants_resource.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  void _closeSplash() async {

    await Future.delayed(
      const Duration(seconds: ConstantsResource.SPLASH_DELAY),
    ).then(
          (value) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MAIN_SCREEN_ROUTE,
                  (route) => false,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetResources.splash), fit: BoxFit.cover)
      ),
    );
  }
}
