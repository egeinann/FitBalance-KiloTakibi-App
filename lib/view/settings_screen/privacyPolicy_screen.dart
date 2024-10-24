import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Privacy Policy'.tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: context.paddingLow,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '1. Data Collection'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'The FitBalance app may collect and store the following types of data:\n'
                '- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n'
                '- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n'
                '- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n'
                        '- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '2. Data Usage'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'The collected data is used solely for the following purposes:\n'
                '- To assist users in tracking their weight and health information.\n'
                '- To help users reach their target weights.\n'
                '- To show users progress through charts and statistics.\n'
                        '- To perform BMI calculations.'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '3. Data Storage'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                '- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n'
                        '- User Control: You can delete or update your data at any time through the app.'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '4. Data Sharing'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '5. User Rights'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                '- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n'
                        '- We guarantee that your data will not be shared with third parties.'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '6. Changes to the Privacy Policy'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '7. Contact'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'If you have any questions regarding our privacy policy, please contact us:\n'
                        '- Email: fitbalance.app@gmail.com'
                    .tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
