import 'package:url_launcher/url_launcher.dart';

class EmailService {
  // Email gönderen fonksiyon
  Future<void> sendEmail({
    required String to, // Alıcı e-posta adresi
}) async {
    // mailto URI'si oluşturuluyor
    final Uri uri = Uri(
      scheme: 'mailto',
      path: to, // Alıcı adresi
    );

    // E-postayı göndermek için URL'yi açmayı deniyoruz
    if (!await launchUrl(uri)) {
      throw 'Email error: $uri'; // Eğer URL açılamıyorsa hata fırlat
    }
  }
}
