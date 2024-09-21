import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/loading.json', // Sabit Lottie dosyası yolu
        fit: BoxFit.scaleDown, // Sabit BoxFit değeri
      ),
    );
  }
}
