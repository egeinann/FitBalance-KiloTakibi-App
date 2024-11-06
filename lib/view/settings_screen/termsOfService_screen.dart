import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:kilo_takibi_uyg/extensions/padding_extensions.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Terms of Service'.tr,
          style: Get.theme.textTheme.titleLarge,
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
                '1. Acceptance of Terms'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '2. User Responsibilities'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'You are responsible for your own actions while using the application. You must not:\n'
                '- Use the application for any unlawful purpose.\n'
                '- Violate any local, state, national, or international laws.\n'
                        '- Transmit any harmful or malicious software.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '3. Intellectual Property'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '4. Limitation of Liability'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '5. Changes to Terms'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '6. Governing Law'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                '7. Contact Information'.tr,
                style: Get.theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              const SizedBox(height: 3),
              AutoSizeText(
                'If you have any questions regarding these Terms of Service, please contact us at:\n'
                        '- Email: fitbalance.app@gmail.com'
                    .tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                'By using the application, you agree to these terms.'.tr,
                style: Get.theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
