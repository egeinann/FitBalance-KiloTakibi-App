import 'package:url_launcher/url_launcher.dart';

class EmailService {
  // Email gönderen fonksiyon
  Future<void> sendEmail({
    required String to, // Alıcı e-posta adresi
    String? subject, // E-posta konusu (isteğe bağlı)
    String? body, // E-posta içeriği (isteğe bağlı)
  }) async {
    // mailto URI'si oluşturuluyor
    final Uri uri = Uri(
      scheme: 'mailto',
      path: to, // Alıcı adresi
      queryParameters: {
        if (subject != null) 'subject': subject, // Konu varsa ekle
        if (body != null) 'body': body, // İçerik varsa ekle
      },
    );

    // E-postayı göndermek için URL'yi açmayı deniyoruz
    if (!await launchUrl(uri)) {
      throw 'email error: $uri'; // Eğer URL açılamıyorsa hata fırlat
    }
  }
}
