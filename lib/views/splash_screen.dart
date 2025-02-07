import 'package:flutter/material.dart';
import 'package:test1/common/assets_image.dart';
import 'package:test1/common/size_config.dart';
import 'package:test1/routes/navigation_route.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    super.initState();

    _startAnimation();
  }

  void _startAnimation() {
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, NavigationRoute.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: SizeConfig.orientation == Orientation.portrait
              ? SizeConfig.getProportionateScreenWidth(300)
              : SizeConfig.getProportionateScreenHeight(300),
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value * 6.283,
                  child: Image.asset(Klogo),
                );
              }),
        ),
      ),
    );
  }
}
