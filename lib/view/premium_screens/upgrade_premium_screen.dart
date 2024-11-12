import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kilo_takibi_uyg/controllers/settings_controller.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/widgets/floatingActionButton.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UpgradePremiumScreen extends GetView<SettingsController> {
  UpgradePremiumScreen({super.key});
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close)),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Padding(
                padding: context.paddingLow,
                child: Column(
                  children: [
                    pageIndicator(),
                    const SizedBox(height: 50),
                    middlePanelScroll(),
                  ],
                ),
              ),
            ),
          ),
          bottomPanel(),
        ],
      ),
    );
  }

  // *** MIDDLE SCROLL PANEL ***
  Column middlePanelScroll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          "Rise for a Healthy Future!".tr,
          textAlign: TextAlign.center,
          style: Get.theme.textTheme.labelSmall,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Get.theme.cardColor,
            child: const Icon(Ionicons.megaphone_outline),
          ),
          title: AutoSizeText(
            "Reach your goal with ad-free, uninterrupted tracking!".tr,
            style: Get.theme.textTheme.bodySmall,
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Get.theme.cardColor,
            child: const Icon(Ionicons.analytics),
          ),
          title: AutoSizeText(
            "Easily track your progress with graphs and boost your motivation!"
                .tr,
            style: Get.theme.textTheme.bodySmall,
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Get.theme.cardColor,
            child: const Icon(Ionicons.hardware_chip_outline),
          ),
          title: AutoSizeText(
            "Embark on a healthy journey with artificial intelligence suggestions!"
                .tr,
            style: Get.theme.textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () {
            // Tema durumuna göre uygun Lottie dosyasını belirle
            String lottieAsset;
            switch (controller.themeMode.value) {
              case ThemeMode.light:
                lottieAsset = 'assets/lottie/premiumMiddle.json';
                break;
              case ThemeMode.dark:
                lottieAsset = 'assets/lottie/premiumMiddle2.json';
                break;
              case ThemeMode.system:
              default:
                // Eğer sistem temasını kullanıyorsanız, burada istediğiniz bir Lottie dosyasını kullanabilirsiniz.
                // Örneğin, sistem temasına özel bir animasyon dosyası kullanabilirsiniz.
                lottieAsset =
                    'assets/lottie/premiumMiddle.json'; // Varsayılan bir animasyon dosyası
                break;
            }

            return Lottie.asset(
              lottieAsset,
              fit: BoxFit.cover,
              height: 300,
            );
          },
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          "Why choose premium?".tr,
          textAlign: TextAlign.center,
          style: Get.theme.textTheme.labelSmall,
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          "With Premium membership, you will have an ad-free experience. In addition, you can easily track your progress thanks to advanced graphic tracking and receive the most appropriate recommendations for your personal goals with the artificial intelligence model. Take advantage of Premium on your healthy life journey!"
              .tr,
          textAlign: TextAlign.center,
          style: Get.theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        AutoSizeText(
          "Premium membership is only \$39.90!\nAnd it is a one-time purchase.\nMembership is unlimited."
              .tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.green.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  // *** BOTTOM BUTTON UPGRADE PREMIUM ***
  Expanded bottomPanel() {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 130, 130, 130)
                  .withOpacity(0.4), // Gölgenin rengi ve opaklığı
              spreadRadius: 0, // Gölgenin yayılma miktarını sıfır yapıyoruz
              blurRadius: 10, // Gölgenin yumuşaklığı
              offset: const Offset(
                  0, -5), // Gölgeyi yukarı (negatif y değer) taşıyoruz
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => customFloatingActionButton(
                  heroTag: "profile",
                  widget: !controller.hasPaid.value
                      ? AutoSizeText(
                          "Upgrade premium".tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Icon(Icons.done),
                  onPressed: () {
                    if (!controller.hasPaid.value) {
                      controller.completePayment();
                      Get.toNamed(Routes.openedpremiumscreen);
                    } else {
                      Get.back();
                    }
                  },
                ),
              ),
              AutoSizeText(
                "It is a one-time purchase".tr,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // *** TOP PREMIUM PAGE INDICATOR ***
  Column pageIndicator() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: PageView(
            controller: _pageController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage(
                          "assets/images/upgradePremium/premium_noads.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "No more ads!".tr,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.labelSmall,
                        ),
                        AutoSizeText(
                          "Clean and simple interface without ads".tr,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage(
                          "assets/images/upgradePremium/premium_graphs.png"),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Graphics!".tr,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.labelSmall,
                        ),
                        AutoSizeText(
                          "Weight tracking step by step with graphics".tr,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Image(
                      image: AssetImage(
                        "assets/images/upgradePremium/premium_AI.png",
                      ),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Artificial Intelligence!".tr,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.labelSmall,
                        ),
                        AutoSizeText(
                          "Healthier suggestions with artificial intelligence chatbot"
                              .tr,
                          textAlign: TextAlign.center,
                          style: Get.theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: WormEffect(
            dotColor: Get.theme.cardColor,
            activeDotColor: Get.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
