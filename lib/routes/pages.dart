import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/binding/bmi_binding.dart';
import 'package:kilo_takibi_uyg/binding/controllers_binding.dart';
import 'package:kilo_takibi_uyg/binding/info_binding.dart';
import 'package:kilo_takibi_uyg/binding/onboarding_binding.dart';
import 'package:kilo_takibi_uyg/controllers/controller.dart';
import 'package:kilo_takibi_uyg/onboarding/model/onboarding_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_ai_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_graph_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_name_Screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_photoGallery_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_start_screen.dart';
import 'package:kilo_takibi_uyg/onboarding/view/intro_targetWeight_screen.dart';
import 'package:kilo_takibi_uyg/routes/routes.dart';
import 'package:kilo_takibi_uyg/view/add_screen.dart';
import 'package:kilo_takibi_uyg/view/chat_screen.dart';
import 'package:kilo_takibi_uyg/view/gallery_screen/gallery_screen.dart';
import 'package:kilo_takibi_uyg/view/gallery_screen/photo_screen.dart';
import 'package:kilo_takibi_uyg/view/graph_view_screen.dart';
import 'package:kilo_takibi_uyg/view/history_screen/history_screen.dart';
import 'package:kilo_takibi_uyg/view/history_screen/recordScreen.dart';
import 'package:kilo_takibi_uyg/view/home_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/view/bmi_info.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/bmi/view/bmi_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/changeName_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/changeTargetWeight_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/model/info_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/activity_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/nutrition_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/sleep_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/info/view/water_screen.dart';
import 'package:kilo_takibi_uyg/view/profile_screen/profile_screen.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/about_the_app_sceen.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/data_management_screen.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/privacyPolicy_screen.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/settings_screen.dart';
import 'package:kilo_takibi_uyg/view/settings_screen/termsOfService_screen.dart';
import 'package:kilo_takibi_uyg/view/upgrade_premium_screen.dart';

abstract class AppPages {
  static final pages = [
    // onboarding
    GetPage(
      name: Routes.onboardingscreen,
      page: () => OnboardingScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.introaiscreen,
      page: () => IntroAiScreen(),
    ),
    GetPage(
      name: Routes.intrographscreen,
      page: () => IntroGraphScreen(),
    ),
    GetPage(
      name: Routes.intronamescreen,
      page: () => IntroNameScreen(),
    ),
    GetPage(
      name: Routes.introphotogalleryscreen,
      page: () => IntroPhotoGalleryScreen(),
    ),
    GetPage(
      name: Routes.introstartscreen,
      page: () => IntroStartScreen(),
    ),
    GetPage(
      name: Routes.introtargetweightscreen,
      page: () => IntroTargetWeightScreen(),
    ),

    // app
    GetPage(
      name: Routes.homescreen,
      page: () => HomeScreen(),
      binding: ControllerBinding(),
    ),
    GetPage(
      name: Routes.graphscreen,
      page: () => GraphViewScreen(),
    ),
    GetPage(
      name: Routes.galleryscreen,
      page: () => GalleryScreen(records: Get.find<Controller>().records),
    ),
    GetPage(
      name: Routes.addscreen,
      page: () => AddScreen(),
    ),
    GetPage(
      name: Routes.historyscreen,
      page: () => HistoryScreen(),
    ),
    GetPage(
      name: Routes.profilescreen,
      page: () => ProfileScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.settingsscreen,
      page: () => SettingsScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.chatscreen,
      page: () => ChatScreen(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: Routes.photoscreen,
      page: () => PhotoScreen(),
    ),
    GetPage(
      name: Routes.recordscreen,
      page: () => RecordScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.changenamescreen,
      page: () => ChangeNameScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.changetargetweightscreen,
      page: () => ChangeTargetWeightScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: Routes.abouttheappscreen,
      page: () => AboutTheAppScreen(),
    ),
    GetPage(
      name: Routes.datamanagementscreen,
      page: () => DataManagementScreen(),
    ),
    GetPage(
      name: Routes.privacypolicyscreen,
      page: () => PrivacyPolicyScreen(),
    ),
    GetPage(
      name: Routes.termsofservicescreen,
      page: () => TermsOfServiceScreen(),
    ),
    GetPage(
      name: Routes.upgradepremiumscreen,
      page: () => UpgradePremiumScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.bmiinfoscreen,
      page: () => BmiInfoScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.bmiscreen,
      page: () => BmiScreen(),
      transition: Transition.fadeIn,
      binding: BmiBinding(),
    ),
    GetPage(
      name: Routes.infoscreen,
      page: () => InfoScreen(),
      transition: Transition.fadeIn,
      binding: InfoBinding(),
    ),
    GetPage(
      name: Routes.activityscreen,
      page: () => InfoActivityScreen(),
    ),
    GetPage(
      name: Routes.nutritionscreen,
      page: () => InfoNutritionScreen(),
    ),
    GetPage(
      name: Routes.sleepscreen,
      page: () => InfoSleepScreen(),
    ),
    GetPage(
      name: Routes.waterscreen,
      page: () => InfoWaterScreen(),
    ),
  ];
}
