import 'package:bookly_app/Features/Splash/presentation_layer/views/widgets/sliding_text.dart';
import 'package:bookly_app/Features/home/presentation_layer/views/home_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget{

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState(){
    super.initState();
    initSlidingAnimation();

    NavigateToHome();
  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 4,),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController=AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation=Tween<Offset>(
        begin: const Offset(0,2) ,end:Offset.zero).animate(animationController);

    // Start the animation
    animationController.forward();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 2),() {
      // Get.to(() => HomeView(), transition: Transition.fade,
      //     duration: KTransitionDuration);
      GoRouter.of(context).push('/homeView');
    });
  }
}

