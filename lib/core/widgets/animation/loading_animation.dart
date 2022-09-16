import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/context_extension.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.veryHighValue3x,
      child: LottieBuilder.asset("assets/animations/loading_animation.json"),
    );
  }
}
