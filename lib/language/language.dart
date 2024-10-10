import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  static const defa = Locale("en", "US"); // default dil
  static final languageList = [
    // dil listesi
    const Locale("tr", "TR"),
    const Locale("en", "US"),
    const Locale("es", "ES"),
    const Locale("fr", "FR"),
    const Locale("de", "DE"),
    const Locale("pt", "PT"),
    const Locale("zh", "CN"),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'You must pay to see graphs and track your progress in more detail.',
          'Payment': 'Payment',
          'Developer': 'Developer',
          'After 1 week of analysis, the graphs appear!':
              'After 1 week of analysis, the graphs appear!',

          // GalleryScreen
          "You don't have any photos yet !": "You don't have any photos yet !",

          // AddScreen
          "There is already a record for the same date":
              "There is already a record for the same date",
          "Change the date": "Change the date",
          "note": "note",
          "YOUR WEIGHT": "YOUR WEIGHT",
          "kg": "kg",
          "Take a photo": "Take a photo",
          "Pick from gallery": "Pick from gallery",

          // HistoryScreen
          "Record": "Record",
          "Select Month": "Select Month",
          "January": "January",
          "February": "February",
          "March": "March",
          "April": "April",
          "May": "May",
          "June": "June",
          "July": "July",
          "August": "August",
          "September": "September",
          "October": "October",
          "November": "November",
          "December": "December",
          "No records found for this month": "No records found for this month.",
          "Please select a different month.":
              "Please select a different month.",
          "Delete all records !": "Delete all records !",
          "Are you sure all records will be deleted ?":
              "Are you sure all records will be deleted?",
          "You deleted all records": "You deleted all records.",
          "There are no more records": "There are no more records.",

          // FadeNoRecord
          "No record found !": "No record found !",

          // ProfileScreen
          "Weight balance": "Weight balance",
          "Calculate BMI": "Calculate BMI",
          "Male": "Male",
          "Female": "Female",
          "NAME": "NAME",
          "TARGET WEIGHT": "TARGET WEIGHT",

          // Controller
          'Graph': 'Graph',
          'Line Graph': 'Line Graph',
          'Bar Graph': 'Bar Graph',
          'Error Graph': 'Error Graph',
          'Gallery': 'Gallery',
          'Add': 'Add',
          'History': 'History',
          'Profile': 'Profile',
          'App': 'App',

          // SettingsScreen
          'Language': 'Language',
          'Theme': 'Theme',
          'Notifications': 'Notifications',
          'Reminder for process tracking': 'Reminder for process tracking',
          'Privacy Policy': 'Privacy Policy',
          'Protection of personal data': 'Protection of personal data',
          'Terms of service': 'Terms of service',
          'You have accepted these terms': 'You have accepted these terms',
          'Data management': 'Data management',
          'Data backup, restore and data wipe':
              'Data backup, restore and data wipe',
          'About the app': 'About the app',
          'Settings': 'Settings',

          // PrivacyPolicyScreen
          "Privacy Policy": "Privacy Policy",
          "1. Data Collection": "1. Data Collection",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.",
          "2. Data Usage": "2. Data Usage",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.",
          "3. Data Storage": "3. Data Storage",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.",
          "4. Data Sharing": "4. Data Sharing",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.",
          "5. User Rights": "5. User Rights",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.",
          "6. Changes to the Privacy Policy":
              "6. Changes to the Privacy Policy",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.",
          "7. Contact": "7. Contact",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': 'Terms of Service',
          '1. Acceptance of Terms': '1. Acceptance of Terms',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.',
          '2. User Responsibilities': '2. User Responsibilities',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.',
          '3. Intellectual Property': '3. Intellectual Property',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.',
          '4. Limitation of Liability': '4. Limitation of Liability',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.',
          '5. Changes to Terms': '5. Changes to Terms',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.',
          '6. Governing Law': '6. Governing Law',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.',
          '7. Contact Information': '7. Contact Information',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              'By using the application, you agree to these terms.',

          // DataManagementScreen
          'Data Management': 'Data Management',
          'Backup Data': 'Backup Data',
          'Restore Data': 'Restore Data',
          'Wipe Data': 'Wipe Data',

          // AboutTheAppScreen
          'About The App': 'About The App',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.',
          'Version: 1.0.0': 'Version: 1.0.0',
          'Developed by: egedeveloper': 'Developed by: egedeveloper',
          'Mail: fitbalance.app@gmail.com': 'Mail: fitbalance.app@gmail.com',
          'You must be healthy !': 'You must be healthy !',

          // BarGraph
          'Averages of the last 1 year': 'Averages of the last 1 year',
          'kg': 'kg',

          // LineGraph
          "all records": "All records",
          "last 30 days": "Records of the last 30 days",
          "kg": "kg",
          "All records": "All records",
          "Records of the last 30 days": "Records of the last 30 days",

          // RecordListTile
          'note': 'note',
          'kg': 'kg',

          // DeleteShowDialog
          'Delete': 'Delete',
          'Cancel': 'Cancel',

          // RecordScreen
          "kg": "kg",
          "note": "Note",
          "Edit Record": "Edit Record",
          "Save": "Save",
          "Record updated": "Record updated",
          "Delete Record": "Delete Record",
          "Are you sure you want to delete this record ?":
              "Are you sure you want to delete this record?",
          "Delete Photo": "Delete Photo",
          "Are you sure you want to delete this photo ?":
              "Are you sure you want to delete this photo?",
          "No photo !": "No photo!",

          // ChangeNmaeScreen
          'Name': 'Name',
          'Your name': 'Your name',
          'Name ?': 'Name?',
          'Please enter your name': 'Please enter your name',
          'You changed your name': 'You changed your name',

          // ChangeTargetWeightScreen
          'Target Weight': 'Target Weight',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.',
          'Your target weight has been updated':
              'Your target weight has been updated',
          'Good luck': 'Good luck',
        },
        'tr_TR': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Grafikleri görmek ve ilerlemeni daha ayrıntılı takip etmek için ödeme yapmalısın.',
          'Payment': 'Ödeme',
          'Developer': 'Geliştirici',
          'After 1 week of analysis, the graphs appear!':
              '1 haftalık analizden sonra grafikler görünüyor!',

          // GalleryScreen
          "You don't have any photos yet !": "Henüz hiç fotoğrafın yok !",

          // AddScreen
          "There is already a record for the same date":
              "Aynı tarih için zaten bir kayıt var.",
          "Change the date": "Tarihi değiştir.",
          "note": "not",
          "YOUR WEIGHT": "KİLOM",
          "kg": "kg",
          "Take a photo": "Fotoğraf çek.",
          "Pick from gallery": "Galeriden seç.",

          // HistoryScreen
          "Record": "Kayıt",
          "Select Month": "Ay Seç",
          "January": "Ocak",
          "February": "Şubat",
          "March": "Mart",
          "April": "Nisan",
          "May": "Mayıs",
          "June": "Haziran",
          "July": "Temmuz",
          "August": "Ağustos",
          "September": "Eylül",
          "October": "Ekim",
          "November": "Kasım",
          "December": "Aralık",
          "No records found for this month": "Bu ay için kayıt bulunamadı.",
          "Please select a different month.": "Lütfen farklı bir ay seçin.",
          "Delete all records !": "Tüm kayıtları sil!",
          "Are you sure all records will be deleted ?":
              "Tüm kayıtların silineceğinden emin misiniz?",
          "You deleted all records": "Tüm kayıtları sildiniz.",
          "There are no more records": "Başka kayıt yok.",

          // FadeNoRecord
          "No record found !": "Kayıt bulunamadı!",

          // ProfileScreen
          "Weight balance": "Ağırlık dengesi",
          "Calculate BMI": "BKI Hesapla",
          "Male": "Erkek",
          "Female": "Kadın",
          "NAME": "İSİM",
          "TARGET WEIGHT": "HEDEF AĞIRLIK",

          // Controller
          'Graph': 'Grafik',
          'Line Graph': 'Çizgi Grafiği',
          'Bar Graph': 'Çubuk Grafiği',
          'Error Graph': 'Hata Grafiği',
          'Gallery': 'Galeri',
          'Add': 'Ekle',
          'History': 'Geçmiş',
          'Profile': 'Profil',
          'App': 'Uygulama',

          // SettingsScreen
          'Language': 'Dil',
          'Theme': 'Tema',
          'Notifications': 'Bildirimler',
          'Reminder for process tracking': 'Süreç takibi için hatırlatıcı',
          'Privacy Policy': 'Gizlilik Politikası',
          'Protection of personal data': 'Kişisel verilerin korunması',
          'Terms of service': 'Hizmet Şartları',
          'You have accepted these terms': 'Bu şartları kabul ettiniz',
          'Data management': 'Veri yönetimi',
          'Data backup, restore and data wipe':
              'Veri yedekleme, geri yükleme ve veri silme',
          'About the app': 'Uygulama Hakkında',
          'Settings': 'Ayarlar',

          // PrivacyPolicyScreen
          "Privacy Policy": "Gizlilik Politikası",
          "1. Data Collection": "1. Veri Toplama",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "FitBalance uygulaması aşağıdaki veri türlerini toplayabilir ve saklayabilir:\n- Ağırlık Verileri: Ağırlık, tarih, notlar ve isteğe bağlı fotoğraf verilerini cihazınızda yerel olarak saklıyoruz.\n- Fotoğraflar: Kullanıcılar, ağırlık kayıtlarına eklemek için fotoğraf çekebilir veya cihazlarından fotoğraf seçebilir. Bu fotoğraflar sadece cihazınızda saklanır ve uygulama dışına iletilmez.\n- Hedef Ağırlık: Kullanıcı tarafından tanımlanan hedef ağırlık bilgileri, kullanıcıların hedeflerini takip etmelerine olanak sağlamak için yerel olarak saklanır.\n- BMI (Vücut Kitle İndeksi) Verileri: Kullanıcılar boy ve ağırlık bilgilerini girdiğinde, BMI hesaplamaları yapılır. Bu veriler de yalnızca yerel olarak saklanır.",
          "2. Data Usage": "2. Veri Kullanımı",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "Toplanan veriler yalnızca şu amaçlar için kullanılır:\n- Kullanıcıların ağırlık ve sağlık bilgilerini takip etmelerine yardımcı olmak.\n- Kullanıcıların hedef ağırlıklarına ulaşmalarına yardımcı olmak.\n- Kullanıcılara grafikler ve istatistikler aracılığıyla ilerlemelerini göstermek.\n- BMI hesaplamaları yapmak.",
          "3. Data Storage": "3. Veri Depolama",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- Yerel Depolama: Verileriniz (ağırlık, notlar, fotoğraflar) cihazınızdaki yerel veritabanında (SQLite) saklanır. Bu veri, internet bağlantısı olmadan tamamen cihazınızda kalır. Verileriniz asla herhangi bir sunucuya veya bulut depolama hizmetine gönderilmez.\n- Kullanıcı Kontrolü: Verilerinizi uygulama aracılığıyla istediğiniz zaman silebilir veya güncelleyebilirsiniz.",
          "4. Data Sharing": "4. Veri Paylaşımı",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "FitBalance uygulaması, toplanan verileri üçüncü şahıslarla paylaşmaz. Tüm veriler yalnızca cihazınızda saklanır ve uygulama dışına aktarılmaz.",
          "5. User Rights": "5. Kullanıcı Hakları",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- Verilerinizi görüntüleme, güncelleme veya silme hakkına sahipsiniz. Bu işlemler uygulama aracılığıyla doğrudan gerçekleştirilebilir.\n- Verilerinizin üçüncü şahıslarla paylaşılmayacağını garanti ediyoruz.",
          "6. Changes to the Privacy Policy":
              "6. Gizlilik Politikasındaki Değişiklikler",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "Bu gizlilik politikası zaman zaman güncellenebilir. Önemli değişiklikler hakkında uygulama içi bildirimlerle bilgilendirileceksiniz.",
          "7. Contact": "7. İletişim",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "Gizlilik politikamızla ilgili herhangi bir sorunuz varsa, lütfen bizimle iletişime geçin:\n- E-posta: fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': 'Hizmet Şartları',
          '1. Acceptance of Terms': '1. Şartların Kabulü',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              'FitBalance uygulamasını kullanarak bu Hizmet Şartlarına uymayı ve bağlı kalmayı kabul ediyorsunuz. Bu şartlara katılmıyorsanız, lütfen uygulamayı kullanmayın.',
          '2. User Responsibilities': '2. Kullanıcı Sorumlulukları',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              'Uygulamayı kullanırken kendi eylemlerinizden sorumlusunuz. Şunları yapmamalısınız:\n'
                  '- Uygulamayı herhangi bir yasadışı amaç için kullanmak.\n'
                  '- Herhangi bir yerel, eyalet, ulusal veya uluslararası yasayı ihlal etmek.\n'
                  '- Zararlı veya kötü niyetli yazılım göndermek.',
          '3. Intellectual Property': '3. Fikri Mülkiyet',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'FitBalance uygulamasında mevcut olan tüm içerik ve materyaller, metin, grafikler ve logolar dahil olmak üzere, FitBalance veya lisans verenlerine aittir ve telif hakkı, ticari marka ve diğer fikri mülkiyet yasalarıyla korunmaktadır.',
          '4. Limitation of Liability': '4. Sorumluluğun Sınırlandırılması',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance, uygulamanın kullanımından veya kullanamamasından kaynaklanan herhangi bir doğrudan, dolaylı, tesadüfi, özel veya sonuç olarak doğan zararlardan sorumlu değildir.',
          '5. Changes to Terms': '5. Şartlarda Değişiklikler',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance, bu Hizmet Şartlarını istediği zaman değiştirme hakkını saklı tutar. Değişiklikler, gözden geçirilmiş şartların uygulamada yayımlanması ile yürürlüğe girecektir.',
          '6. Governing Law': '6. Uygulanacak Hukuk',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              'Bu Hizmet Şartları, Türkiye yasalarına tabi olacak ve buna göre yorumlanacaktır.',
          '7. Contact Information': '7. İletişim Bilgileri',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              'Bu Hizmet Şartları hakkında herhangi bir sorunuz varsa, lütfen bizimle iletişime geçin:\n'
                  '- E-posta: fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              'Uygulamayı kullanarak bu şartları kabul edersiniz.',

          // DataManagementScreen
          'Data Management': 'Veri Yönetimi',
          'Backup Data': 'Veri Yedekleme',
          'Restore Data': 'Veri Geri Yükleme',
          'Wipe Data': 'Veri Silme',

          // AboutTheAppScreen
          'About The App': 'Uygulama Hakkında',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              'Bu uygulama, kilonuzu takip etmenize ve ilerlemenizi adım adım analiz etmenize yardımcı olur. Daha ayrıntılı bir analiz için fotoğraflar, notlar ekleyebilir ve BMI hesaplamalarını görebilirsiniz.',
          'Version: 1.0.0': 'Sürüm: 1.0.0',
          'Developed by: egedeveloper': 'Geliştiren: egedeveloper',
          'Mail: fitbalance.app@gmail.com': 'E-posta: fitbalance.app@gmail.com',
          'You must be healthy !': 'Sağlıklı olmalısınız!',

          // BarGraph
          'Averages of the last 1 year': 'Son 1 yılın ortalamaları',
          'kg': 'kg',

          // LineGraph
          "all records": "Tüm kayıtlar",
          "last 30 days": "Son 30 gün",
          "kg": "kg",
          "All records": "Tüm kayıtlar",
          "Records of the last 30 days": "Son 30 gün kayıtları",

          // RecordListTile
          'note': 'not',
          'kg': 'kg',

          // DeleteShowDialog
          'Delete': 'Sil',
          'Cancel': 'İptal',

          // RecordScreen
          "kg": "kg",
          "note": "Not",
          "Edit Record": "Kaydı Düzenle",
          "Save": "Kaydet",
          "Record updated": "Kayıt güncellendi",
          "Delete Record": "Kaydı Sil",
          "Are you sure you want to delete this record ?":
              "Bu kaydı silmek istediğinizden emin misiniz?",
          "Delete Photo": "Fotoğrafı Sil",
          "Are you sure you want to delete this photo ?":
              "Bu fotoğrafı silmek istediğinizden emin misiniz?",
          "No photo !": "Fotoğraf yok!",

          // ChangeNmaeScreen
          'Name': 'İsim',
          'Your name': 'Adınız',
          'Name ?': 'İsim?',
          'Please enter your name': 'Lütfen adınızı girin',
          'You changed your name': 'Adınızı değiştirdiniz',

          // ChangeTargetWeightScreen
          'Target Weight': 'Hedef Kilo',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              'Sağlıklı bir yaşam doğru hedeflerle başlar. Hedef kilonuzu seçin ve her adımda kendinize olan inancınızı hatırlayın.',
          'Your target weight has been updated': 'Hedef kilonuz güncellendi',
          'Good luck': 'Bol şans',
        },
        'es_ES': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Debes pagar para ver gráficos y seguir tu progreso en más detalle.',
          'Payment': 'Pago',
          'Developer': 'Desarrollador',
          'After 1 week of analysis, the graphs appear!':
              '¡Después de una semana de análisis, aparecen los gráficos!',

          // GalleryScreen
          "You don't have any photos yet !": "¡Aún no tienes fotos!",

          // AddScreen
          "There is already a record for the same date":
              "Ya hay un registro para la misma fecha.",
          "Change the date": "Cambia la fecha.",
          "note": "nota",
          "YOUR WEIGHT": "TU PESO",
          "kg": "kg",
          "Take a photo": "Tomar una foto.",
          "Pick from gallery": "Elegir de la galería.",

          // HistoryScreen
          "Record": "Registro",
          "Select Month": "Seleccionar mes",
          "January": "Enero",
          "February": "Febrero",
          "March": "Marzo",
          "April": "Abril",
          "May": "Mayo",
          "June": "Junio",
          "July": "Julio",
          "August": "Agosto",
          "September": "Septiembre",
          "October": "Octubre",
          "November": "Noviembre",
          "December": "Diciembre",
          "No records found for this month":
              "No se encontraron registros para este mes.",
          "Please select a different month.": "Por favor selecciona otro mes.",
          "Delete all records !": "¡Eliminar todos los registros!",
          "Are you sure all records will be deleted ?":
              "¿Estás seguro de que se eliminarán todos los registros?",
          "You deleted all records": "Has eliminado todos los registros.",
          "There are no more records": "No hay más registros.",

          // FadeNoRecord
          "No record found !": "¡Registro no encontrado!",

          // ProfileScreen
          "Weight balance": "Equilibrio de peso",
          "Calculate BMI": "Calcular IMC",
          "Male": "Masculino",
          "Female": "Femenino",
          "NAME": "NOMBRE",
          "TARGET WEIGHT": "PESO OBJETIVO",

          // Controller
          'Graph': 'Gráfico',
          'Line Graph': 'Gráfico de líneas',
          'Bar Graph': 'Gráfico de barras',
          'Error Graph': 'Gráfico de error',
          'Gallery': 'Galería',
          'Add': 'Agregar',
          'History': 'Historial',
          'Profile': 'Perfil',
          'App': 'Aplicación',

          // SettingsScreen
          'Language': 'Idioma',
          'Theme': 'Tema',
          'Notifications': 'Notificaciones',
          'Reminder for process tracking':
              'Recordatorio para el seguimiento de procesos',
          'Privacy Policy': 'Política de privacidad',
          'Protection of personal data': 'Protección de datos personales',
          'Terms of service': 'Términos de servicio',
          'You have accepted these terms': 'Has aceptado estos términos',
          'Data management': 'Gestión de datos',
          'Data backup, restore and data wipe':
              'Copia de seguridad de datos, restauración y borrado de datos',
          'About the app': 'Acerca de la aplicación',
          'Settings': 'Ajustes',

          // PrivacyPolicyScreen
          "Privacy Policy": "Política de Privacidad",
          "1. Data Collection": "1. Recopilación de Datos",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "La aplicación FitBalance puede recopilar y almacenar los siguientes tipos de datos:\n- Datos de Peso: Almacenamos peso, fecha, notas y datos de fotos opcionales localmente en su dispositivo.\n- Fotos: Los usuarios pueden optar por tomar fotos o seleccionarlas de sus dispositivos para adjuntarlas a los registros de peso. Estas fotos se almacenan solo en su dispositivo y no se transmiten a ningún lugar fuera de la aplicación.\n- Peso Objetivo: La información del peso objetivo definida por el usuario se almacena localmente para permitir a los usuarios rastrear sus objetivos.\n- Datos de IMC (Índice de Masa Corporal): Cuando los usuarios ingresan información de altura y peso, se realizan cálculos de IMC. Estos datos también se almacenan solo localmente.",
          "2. Data Usage": "2. Uso de Datos",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "Los datos recopilados se utilizan únicamente para los siguientes propósitos:\n- Para ayudar a los usuarios a rastrear su peso e información de salud.\n- Para ayudar a los usuarios a alcanzar sus pesos objetivos.\n- Para mostrar a los usuarios el progreso a través de gráficos y estadísticas.\n- Para realizar cálculos de IMC.",
          "3. Data Storage": "3. Almacenamiento de Datos",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- Almacenamiento Local: Sus datos (peso, notas, fotos) se almacenan en la base de datos local (SQLite) de su dispositivo. Estos datos permanecen completamente en su dispositivo sin conexión a Internet. Sus datos nunca se envían a ningún servidor o servicio de almacenamiento en la nube.\n- Control del Usuario: Puede eliminar o actualizar sus datos en cualquier momento a través de la aplicación.",
          "4. Data Sharing": "4. Compartición de Datos",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "La aplicación FitBalance no comparte datos recopilados con terceros. Todos los datos se almacenan únicamente en su dispositivo y no se comparten fuera de la aplicación.",
          "5. User Rights": "5. Derechos del Usuario",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- Tiene el derecho de ver, actualizar o eliminar sus datos. Estas operaciones se pueden realizar directamente a través de la aplicación.\n- Garantizamos que sus datos no se compartirán con terceros.",
          "6. Changes to the Privacy Policy":
              "6. Cambios en la Política de Privacidad",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "Esta política de privacidad puede actualizarse de vez en cuando. Se le notificará sobre cambios significativos a través de notificaciones dentro de la aplicación.",
          "7. Contact": "7. Contacto",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "Si tiene alguna pregunta sobre nuestra política de privacidad, contáctenos:\n- Correo electrónico: fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': 'Términos de Servicio',
          '1. Acceptance of Terms': '1. Aceptación de los Términos',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              'Al usar la aplicación FitBalance, usted acepta cumplir con estos Términos de Servicio. Si no está de acuerdo con estos términos, no utilice la aplicación.',
          '2. User Responsibilities': '2. Responsabilidades del Usuario',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              'Usted es responsable de sus propias acciones al usar la aplicación. No debe:\n'
                  '- Usar la aplicación para ningún propósito ilegal.\n'
                  '- Violación de cualquier ley local, estatal, nacional o internacional.\n'
                  '- Transmitir cualquier software dañino o malicioso.',
          '3. Intellectual Property': '3. Propiedad Intelectual',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'Todo el contenido y materiales disponibles en la aplicación FitBalance, incluidos texto, gráficos y logotipos, son propiedad de FitBalance o de sus licenciantes y están protegidos por derechos de autor, marcas comerciales y otras leyes de propiedad intelectual.',
          '4. Limitation of Liability': '4. Limitación de Responsabilidad',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance no será responsable de ningún daño directo, indirecto, incidental, especial o consecuente que resulte del uso o la incapacidad de usar la aplicación.',
          '5. Changes to Terms': '5. Cambios en los Términos',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance se reserva el derecho de modificar estos Términos de Servicio en cualquier momento. Los cambios serán efectivos al publicar los términos revisados en la aplicación.',
          '6. Governing Law': '6. Ley Aplicable',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              'Estos Términos de Servicio se regirán e interpretarán de acuerdo con las leyes de Turquía.',
          '7. Contact Information': '7. Información de Contacto',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              'Si tiene alguna pregunta sobre estos Términos de Servicio, contáctenos en:\n'
                  '- Correo electrónico: fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              'Al usar la aplicación, acepta estos términos.',

          // DataManagementScreen
          'Data Management': 'Gestión de Datos',
          'Backup Data': 'Copia de Seguridad de Datos',
          'Restore Data': 'Restaurar Datos',
          'Wipe Data': 'Borrar Datos',

          // AboutTheAppScreen
          'About The App': 'Acerca de la Aplicación',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              'Esta aplicación te ayuda a seguir tu peso y analizar tu progreso paso a paso. Puedes agregar fotos, notas y ver cálculos de IMC para un análisis más detallado.',
          'Version: 1.0.0': 'Versión: 1.0.0',
          'Developed by: egedeveloper': 'Desarrollado por: egedeveloper',
          'Mail: fitbalance.app@gmail.com': 'Correo: fitbalance.app@gmail.com',
          'You must be healthy !': '¡Debes estar saludable!',

          // BarGraph
          'Averages of the last 1 year': 'Promedios del último año',
          'kg': 'kg',

          // LineGraph
          "all records": "Todos los registros",
          "last 30 days": "Registros de los últimos 30 días",
          "kg": "kg",
          "All records": "Todos los registros",
          "Records of the last 30 days": "Registros de los últimos 30 días",

          // RecordListTile
          'note': 'nota',
          'kg': 'kg',

          // DeleteShowDialog
          'Delete': 'Eliminar',
          'Cancel': 'Cancelar',

          // RecordScreen
          "kg": "kg",
          "note": "Nota",
          "Edit Record": "Editar Registro",
          "Save": "Guardar",
          "Record updated": "Registro actualizado",
          "Delete Record": "Eliminar Registro",
          "Are you sure you want to delete this record ?":
              "¿Estás seguro de que deseas eliminar este registro?",
          "Delete Photo": "Eliminar Foto",
          "Are you sure you want to delete this photo ?":
              "¿Estás seguro de que deseas eliminar esta foto?",
          "No photo !": "¡No hay foto!",

          // ChangeNmaeScreen
          'Name': 'Nombre',
          'Your name': 'Tu nombre',
          'Name ?': '¿Nombre?',
          'Please enter your name': 'Por favor, ingresa tu nombre',
          'You changed your name': 'Has cambiado tu nombre',

          // ChangeTargetWeightScreen
          'Target Weight': 'Peso objetivo',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              'Una vida saludable comienza con los objetivos correctos. Elige tu peso objetivo y recuerda tu confianza en ti mismo en cada paso del camino.',
          'Your target weight has been updated':
              'Tu peso objetivo ha sido actualizado',
          'Good luck': 'Buena suerte',
        },
        'fr_FR': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Vous devez payer pour voir des graphiques et suivre vos progrès plus en détail.',
          'Payment': 'Paiement',
          'Developer': 'Développeur',
          'After 1 week of analysis, the graphs appear!':
              'Après une semaine d’analyse, les graphiques apparaissent !',

          // GalleryScreen
          "You don't have any photos yet !":
              "Vous n'avez pas encore de photos !",

          // AddScreen
          "There is already a record for the same date":
              "Il y a déjà un enregistrement pour la même date.",
          "Change the date": "Changer la date.",
          "note": "note",
          "YOUR WEIGHT": "VOTRE POIDS",
          "kg": "kg",
          "Take a photo": "Prendre une photo.",
          "Pick from gallery": "Choisir dans la galerie.",

          // HistoryScreen
          "Record": "Enregistrement",
          "Select Month": "Sélectionner le mois",
          "January": "Janvier",
          "February": "Février",
          "March": "Mars",
          "April": "Avril",
          "May": "Mai",
          "June": "Juin",
          "July": "Juillet",
          "August": "Août",
          "September": "Septembre",
          "October": "Octobre",
          "November": "Novembre",
          "December": "Décembre",
          "No records found for this month":
              "Aucun enregistrement trouvé pour ce mois.",
          "Please select a different month.":
              "Veuillez sélectionner un autre mois.",
          "Delete all records !": "Supprimer tous les enregistrements !",
          "Are you sure all records will be deleted ?":
              "Êtes-vous sûr que tous les enregistrements seront supprimés ?",
          "You deleted all records":
              "Vous avez supprimé tous les enregistrements.",
          "There are no more records": "Il n'y a plus d'enregistrements.",

          // FadeNoRecord
          "No record found !": "Aucun enregistrement trouvé !",

          // ProfileScreen
          "Weight balance": "Équilibre du poids",
          "Calculate BMI": "Calculer l'IMC",
          "Male": "Homme",
          "Female": "Femme",
          "NAME": "NOM",
          "TARGET WEIGHT": "POIDS CIBLE",

          // Controller
          'Graph': 'Graphique',
          'Line Graph': 'Graphique en lignes',
          'Bar Graph': 'Graphique en barres',
          'Error Graph': 'Graphique d\'erreur',
          'Gallery': 'Galerie',
          'Add': 'Ajouter',
          'History': 'Historique',
          'Profile': 'Profil',
          'App': 'Application',

          // SettingsScreen
          'Language': 'Langue',
          'Theme': 'Thème',
          'Notifications': 'Notifications',
          'Reminder for process tracking': 'Rappel pour le suivi des processus',
          'Privacy Policy': 'Politique de confidentialité',
          'Protection of personal data': 'Protection des données personnelles',
          'Terms of service': 'Conditions de service',
          'You have accepted these terms': 'Vous avez accepté ces conditions',
          'Data management': 'Gestion des données',
          'Data backup, restore and data wipe':
              'Sauvegarde, restauration et suppression des données',
          'About the app': 'À propos de l\'application',
          'Settings': 'Paramètres',

          // PrivacyPolicyScreen
          "Privacy Policy": "Politique de Confidentialité",
          "1. Data Collection": "1. Collecte de Données",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "L'application FitBalance peut collecter et stocker les types de données suivants :\n- Données de Poids : Nous stockons le poids, la date, les notes et les données de photos facultatives localement sur votre appareil.\n- Photos : Les utilisateurs peuvent prendre des photos ou les sélectionner sur leurs appareils pour les joindre aux enregistrements de poids. Ces photos sont stockées uniquement sur votre appareil et ne sont transmises nulle part en dehors de l'application.\n- Poids Cible : Les informations de poids cible définies par l'utilisateur sont stockées localement pour permettre aux utilisateurs de suivre leurs objectifs.\n- Données de l'IMC (Indice de Masse Corporelle) : Lorsque les utilisateurs saisissent des informations sur la taille et le poids, des calculs d'IMC sont effectués. Ces données sont également stockées uniquement localement.",
          "2. Data Usage": "2. Utilisation des Données",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "Les données collectées sont utilisées uniquement aux fins suivantes :\n- Aider les utilisateurs à suivre leur poids et leurs informations de santé.\n- Aider les utilisateurs à atteindre leur poids cible.\n- Montrer aux utilisateurs leurs progrès à travers des graphiques et des statistiques.\n- Effectuer des calculs d'IMC.",
          "3. Data Storage": "3. Stockage des Données",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- Stockage Local : Vos données (poids, notes, photos) sont stockées dans la base de données locale (SQLite) de votre appareil. Ces données restent complètement sur votre appareil sans connexion Internet. Vos données ne sont jamais envoyées à des serveurs ou à des services de stockage en nuage.\n- Contrôle de l'Utilisateur : Vous pouvez supprimer ou mettre à jour vos données à tout moment via l'application.",
          "4. Data Sharing": "4. Partage des Données",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "L'application FitBalance ne partage pas les données collectées avec des tiers. Toutes les données sont stockées uniquement sur votre appareil et ne sont pas partagées en dehors de l'application.",
          "5. User Rights": "5. Droits des Utilisateurs",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- Vous avez le droit de consulter, de mettre à jour ou de supprimer vos données. Ces opérations peuvent être effectuées directement via l'application.\n- Nous garantissons que vos données ne seront pas partagées avec des tiers.",
          "6. Changes to the Privacy Policy":
              "6. Changements dans la Politique de Confidentialité",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "Cette politique de confidentialité peut être mise à jour de temps à autre. Vous serez informé des changements significatifs par le biais de notifications dans l'application.",
          "7. Contact": "7. Contact",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "Si vous avez des questions concernant notre politique de confidentialité, veuillez nous contacter :\n- Email : fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': 'Conditions d\'Utilisation',
          '1. Acceptance of Terms': '1. Acceptation des Conditions',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              'En utilisant l\'application FitBalance, vous acceptez de vous conformer à ces Conditions d\'Utilisation. Si vous n\'acceptez pas ces conditions, veuillez ne pas utiliser l\'application.',
          '2. User Responsibilities': '2. Responsabilités de l\'Utilisateur',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              'Vous êtes responsable de vos propres actions lors de l\'utilisation de l\'application. Vous ne devez pas:\n'
                  '- Utiliser l\'application à des fins illégales.\n'
                  '- Violent les lois locales, nationales ou internationales.\n'
                  '- Transmettre des logiciels nuisibles ou malveillants.',
          '3. Intellectual Property': '3. Propriété Intellectuelle',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'Tout le contenu et les matériaux disponibles sur l\'application FitBalance, y compris le texte, les graphiques et les logos, sont la propriété de FitBalance ou de ses concédants et sont protégés par le droit d\'auteur, les marques commerciales et d\'autres lois sur la propriété intellectuelle.',
          '4. Limitation of Liability': '4. Limitation de Responsabilité',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance ne sera pas responsable des dommages directs, indirects, accessoires, spéciaux ou consécutifs résultant de l\'utilisation ou de l\'incapacité d\'utiliser l\'application.',
          '5. Changes to Terms': '5. Modifications des Conditions',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance se réserve le droit de modifier ces Conditions d\'Utilisation à tout moment. Les modifications entreront en vigueur dès la publication des conditions révisées dans l\'application.',
          '6. Governing Law': '6. Droit Applicable',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              'Ces Conditions d\'Utilisation sont régies et interprétées conformément aux lois de la Turquie.',
          '7. Contact Information': '7. Informations de Contact',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              'Si vous avez des questions concernant ces Conditions d\'Utilisation, veuillez nous contacter à :\n'
                  '- E-mail : fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              'En utilisant l\'application, vous acceptez ces conditions.',

          // DataManagementScreen
          'Data Management': 'Gestion des Données',
          'Backup Data': 'Sauvegarde des Données',
          'Restore Data': 'Restaurer les Données',
          'Wipe Data': 'Effacer les Données',

          // AboutTheAppScreen
          'About The App': 'À propos de l\'application',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              'Cette application vous aide à suivre votre poids et à analyser vos progrès étape par étape. Vous pouvez ajouter des photos, des notes et voir les calculs de l\'IMC pour une analyse plus détaillée.',
          'Version: 1.0.0': 'Version: 1.0.0',
          'Developed by: egedeveloper': 'Développé par: egedeveloper',
          'Mail: fitbalance.app@gmail.com': 'Email: fitbalance.app@gmail.com',
          'You must be healthy !': 'Vous devez être en bonne santé !',

          // BarGraph
          'Averages of the last 1 year': 'Moyennes de la dernière année',
          'kg': 'kg',

          // LineGraph
          "all records": "Tous les enregistrements",
          "last 30 days": "Enregistrements des 30 derniers jours",
          "kg": "kg",
          "All records": "Tous les enregistrements",
          "Records of the last 30 days":
              "Enregistrements des 30 derniers jours",

          // RecordListTile
          'note': 'note',
          'kg': 'kg',

          // DeleteShowDialog
          'Delete': 'Supprimer',
          'Cancel': 'Annuler',

          // RecordScreen
          "kg": "kg",
          "note": "Remarque",
          "Edit Record": "Modifier l'enregistrement",
          "Save": "Enregistrer",
          "Record updated": "Enregistrement mis à jour",
          "Delete Record": "Supprimer l'enregistrement",
          "Are you sure you want to delete this record ?":
              "Êtes-vous sûr de vouloir supprimer cet enregistrement ?",
          "Delete Photo": "Supprimer la photo",
          "Are you sure you want to delete this photo ?":
              "Êtes-vous sûr de vouloir supprimer cette photo ?",
          "No photo !": "Pas de photo !",

          // ChangeNmaeScreen
          'Name': 'Nom',
          'Your name': 'Votre nom',
          'Name ?': 'Nom ?',
          'Please enter your name': 'Veuillez entrer votre nom',
          'You changed your name': 'Vous avez changé votre nom',

          // ChangeTargetWeightScreen
          'Target Weight': 'Poids cible',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              'Une vie saine commence par les bons objectifs. Choisissez votre poids cible et souvenez-vous de votre confiance en vous à chaque étape.',
          'Your target weight has been updated':
              'Votre poids cible a été mis à jour',
          'Good luck': 'Bonne chance',
        },
        'de_DE': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Sie müssen bezahlen, um Diagramme zu sehen und Ihren Fortschritt detaillierter zu verfolgen.',
          'Payment': 'Zahlung',
          'Developer': 'Entwickler',
          'After 1 week of analysis, the graphs appear!':
              'Nach einer Woche der Analyse erscheinen die Diagramme!',

          // GalleryScreen
          "You don't have any photos yet !": "Sie haben noch keine Fotos!",

          // AddScreen
          "There is already a record for the same date":
              "Es gibt bereits einen Datensatz für dasselbe Datum.",
          "Change the date": "Datum ändern.",
          "note": "Notiz",
          "YOUR WEIGHT": "DEIN GEWICHT",
          "kg": "kg",
          "Take a photo": "Ein Foto machen.",
          "Pick from gallery": "Aus der Galerie auswählen.",

          // HistoryScreen
          "Record": "Aufzeichnung",
          "Select Month": "Monat auswählen",
          "January": "Januar",
          "February": "Februar",
          "March": "März",
          "April": "April",
          "May": "Mai",
          "June": "Juni",
          "July": "Juli",
          "August": "August",
          "September": "September",
          "October": "Oktober",
          "November": "November",
          "December": "Dezember",
          "No records found for this month":
              "Keine Aufzeichnungen für diesen Monat gefunden.",
          "Please select a different month.":
              "Bitte wählen Sie einen anderen Monat.",
          "Delete all records !": "Alle Aufzeichnungen löschen!",
          "Are you sure all records will be deleted ?":
              "Sind Sie sicher, dass alle Aufzeichnungen gelöscht werden sollen?",
          "You deleted all records": "Sie haben alle Aufzeichnungen gelöscht.",
          "There are no more records": "Es gibt keine weiteren Aufzeichnungen.",

          // FadeNoRecord
          "No record found !": "Keine Aufzeichnung gefunden!",

          // ProfileScreen
          "Weight balance": "Gewichtsbalanse",
          "Calculate BMI": "BMI berechnen",
          "Male": "Männlich",
          "Female": "Weiblich",
          "NAME": "NAME",
          "TARGET WEIGHT": "ZIELGEWICHT",

          // Controller
          'Graph': 'Diagramm',
          'Line Graph': 'Liniendiagramm',
          'Bar Graph': 'Balkendiagramm',
          'Error Graph': 'Fehlerdiagramm',
          'Gallery': 'Galerie',
          'Add': 'Hinzufügen',
          'History': 'Verlauf',
          'Profile': 'Profil',
          'App': 'App',

          // SettingsScreen
          'Language': 'Sprache',
          'Theme': 'Thema',
          'Notifications': 'Benachrichtigungen',
          'Reminder for process tracking': 'Erinnerung zur Prozessverfolgung',
          'Privacy Policy': 'Datenschutzrichtlinie',
          'Protection of personal data': 'Schutz personenbezogener Daten',
          'Terms of service': 'Nutzungsbedingungen',
          'You have accepted these terms':
              'Sie haben diese Bedingungen akzeptiert',
          'Data management': 'Datenverwaltung',
          'Data backup, restore and data wipe':
              'Datensicherung, Wiederherstellung und Datenlöschung',
          'About the app': 'Über die App',
          'Settings': 'Einstellungen',

          // PrivacyPolicyScreen
          "Privacy Policy": "Datenschutzbestimmungen",
          "1. Data Collection": "1. Datenerhebung",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "Die FitBalance-App kann die folgenden Datentypen sammeln und speichern:\n- Gewichtsdaten: Wir speichern Gewicht, Datum, Notizen und optionale Fotodaten lokal auf Ihrem Gerät.\n- Fotos: Benutzer können optional Fotos machen oder diese von ihren Geräten auswählen, um sie den Gewichtsdaten beizufügen. Diese Fotos werden nur auf Ihrem Gerät gespeichert und nirgendwo außerhalb der App übertragen.\n- Zielgewicht: Die vom Benutzer definierte Zielgewichtsinformation wird lokal gespeichert, um es den Benutzern zu ermöglichen, ihre Ziele zu verfolgen.\n- BMI (Body-Mass-Index) Daten: Wenn Benutzer Größen- und Gewichtsinformationen eingeben, werden BMI-Berechnungen durchgeführt. Diese Daten werden ebenfalls nur lokal gespeichert.",
          "2. Data Usage": "2. Datennutzung",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "Die gesammelten Daten werden ausschließlich für die folgenden Zwecke verwendet:\n- Um Benutzern zu helfen, ihr Gewicht und ihre Gesundheitsinformationen zu verfolgen.\n- Um Benutzern zu helfen, ihre Zielgewichte zu erreichen.\n- Um Benutzern den Fortschritt durch Diagramme und Statistiken zu zeigen.\n- Um BMI-Berechnungen durchzuführen.",
          "3. Data Storage": "3. Datenspeicherung",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- Lokale Speicherung: Ihre Daten (Gewicht, Notizen, Fotos) werden in der lokalen Datenbank (SQLite) Ihres Geräts gespeichert. Diese Daten bleiben vollständig auf Ihrem Gerät ohne Internetverbindung. Ihre Daten werden niemals an Server oder Cloud-Speicherdienste gesendet.\n- Benutzerkontrolle: Sie können Ihre Daten jederzeit über die App löschen oder aktualisieren.",
          "4. Data Sharing": "4. Datenaustausch",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "Die FitBalance-App teilt gesammelte Daten nicht mit Dritten. Alle Daten werden ausschließlich auf Ihrem Gerät gespeichert und nicht außerhalb der Anwendung geteilt.",
          "5. User Rights": "5. Benutzerrechte",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- Sie haben das Recht, Ihre Daten einzusehen, zu aktualisieren oder zu löschen. Diese Vorgänge können direkt über die App durchgeführt werden.\n- Wir garantieren, dass Ihre Daten nicht mit Dritten geteilt werden.",
          "6. Changes to the Privacy Policy":
              "6. Änderungen der Datenschutzrichtlinie",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "Diese Datenschutzrichtlinie kann von Zeit zu Zeit aktualisiert werden. Sie werden über wesentliche Änderungen durch In-App-Benachrichtigungen informiert.",
          "7. Contact": "7. Kontakt",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "Wenn Sie Fragen zu unserer Datenschutzrichtlinie haben, kontaktieren Sie uns bitte:\n- E-Mail: fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': 'Nutzungsbedingungen',
          '1. Acceptance of Terms': '1. Annahme der Bedingungen',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              'Durch die Nutzung der FitBalance-Anwendung stimmen Sie zu, diese Nutzungsbedingungen einzuhalten und gebunden zu sein. Wenn Sie mit diesen Bedingungen nicht einverstanden sind, verwenden Sie bitte die Anwendung nicht.',
          '2. User Responsibilities': '2. Nutzerverantwortlichkeiten',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              'Sie sind verantwortlich für Ihr eigenes Handeln bei der Nutzung der Anwendung. Sie dürfen nicht:\n'
                  '- Die Anwendung für illegale Zwecke nutzen.\n'
                  '- Lokale, staatliche, nationale oder internationale Gesetze verletzen.\n'
                  '- Schadsoftware oder schädliche Software übermitteln.',
          '3. Intellectual Property': '3. Geistiges Eigentum',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'Alle Inhalte und Materialien, die in der FitBalance-Anwendung verfügbar sind, einschließlich Texte, Grafiken und Logos, sind Eigentum von FitBalance oder seinen Lizenzgebern und durch Urheberrecht, Markenrecht und andere Gesetze zum geistigen Eigentum geschützt.',
          '4. Limitation of Liability': '4. Haftungsbeschränkung',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance haftet nicht für direkte, indirekte, zufällige, spezielle oder Folgeschäden, die sich aus der Nutzung oder der Unfähigkeit zur Nutzung der Anwendung ergeben.',
          '5. Changes to Terms': '5. Änderungen der Bedingungen',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance behält sich das Recht vor, diese Nutzungsbedingungen jederzeit zu ändern. Änderungen werden wirksam, sobald die überarbeiteten Bedingungen in der Anwendung veröffentlicht werden.',
          '6. Governing Law': '6. Anwendbares Recht',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              'Diese Nutzungsbedingungen unterliegen den Gesetzen der Türkei und sind nach diesen auszulegen.',
          '7. Contact Information': '7. Kontaktinformationen',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              'Wenn Sie Fragen zu diesen Nutzungsbedingungen haben, kontaktieren Sie uns bitte unter:\n'
                  '- E-Mail: fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              'Durch die Nutzung der Anwendung stimmen Sie diesen Bedingungen zu.',

          // DataManagementScreen
          'Data Management': 'Datenverwaltung',
          'Backup Data': 'Daten sichern',
          'Restore Data': 'Daten wiederherstellen',
          'Wipe Data': 'Daten löschen',

          // AboutTheAppScreen
          'About The App': 'Über die App',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              'Diese App hilft Ihnen, Ihr Gewicht zu verfolgen und Ihren Fortschritt Schritt für Schritt zu analysieren. Sie können Fotos, Notizen hinzufügen und BMI-Berechnungen für eine detailliertere Analyse anzeigen.',
          'Version: 1.0.0': 'Version: 1.0.0',
          'Developed by: egedeveloper': 'Entwickelt von: egedeveloper',
          'Mail: fitbalance.app@gmail.com': 'E-Mail: fitbalance.app@gmail.com',
          'You must be healthy !': 'Sie müssen gesund sein!',

          // BarGraph
          'Averages of the last 1 year':
              'Durchschnittswerte des letzten Jahres',
          'kg': 'kg',

          // LineGraph
          "all records": "Alle Aufzeichnungen",
          "last 30 days": "Aufzeichnungen der letzten 30 Tage",
          "kg": "kg",
          "All records": "Alle Aufzeichnungen",
          "Records of the last 30 days": "Aufzeichnungen der letzten 30 Tage",

          // RecordListTile
          'note': 'Notiz',
          'kg': 'kg',

          // DeleteShowDialog
          'Delete': 'Löschen',
          'Cancel': 'Abbrechen',

          // RecordScreen
          "kg": "kg",
          "note": "Notiz",
          "Edit Record": "Aufzeichnung bearbeiten",
          "Save": "Speichern",
          "Record updated": "Aufzeichnung aktualisiert",
          "Delete Record": "Aufzeichnung löschen",
          "Are you sure you want to delete this record ?":
              "Sind Sie sicher, dass Sie diese Aufzeichnung löschen möchten?",
          "Delete Photo": "Foto löschen",
          "Are you sure you want to delete this photo ?":
              "Sind Sie sicher, dass Sie dieses Foto löschen möchten?",
          "No photo !": "Kein Foto!",

          // ChangeNameScreen
          'Name': 'Name',
          'Your name': 'Dein Name',
          'Name ?': 'Name?',
          'Please enter your name': 'Bitte geben Sie Ihren Namen ein',
          'You changed your name': 'Du hast deinen Namen geändert',

          // ChangeTargetWeightScreen
          'Target Weight': 'Zielgewicht',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              'Ein gesundes Leben beginnt mit den richtigen Zielen. Wähle dein Zielgewicht und erinnere dich auf jedem Schritt an deinen Glauben an dich selbst.',
          'Your target weight has been updated':
              'Dein Zielgewicht wurde aktualisiert',
          'Good luck': 'Viel Glück',
        },
        'pt_PT': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              'Você deve pagar para ver gráficos e acompanhar seu progresso em mais detalhes.',
          'Payment': 'Pagamento',
          'Developer': 'Desenvolvedor',
          'After 1 week of analysis, the graphs appear!':
              'Após uma semana de análise, os gráficos aparecem!',

          // GalleryScreen
          "You don't have any photos yet !": "Você ainda não tem fotos!",

          // AddScreen
          "There is already a record for the same date":
              "Já existe um registro para a mesma data.",
          "Change the date": "Mudar a data.",
          "note": "nota",
          "YOUR WEIGHT": "O SEU PESO",
          "kg": "kg",
          "Take a photo": "Tirar uma foto.",
          "Pick from gallery": "Escolher da galeria.",

          // HistoryScreen
          "Record": "Registro",
          "Select Month": "Selecionar mês",
          "January": "Janeiro",
          "February": "Fevereiro",
          "March": "Março",
          "April": "Abril",
          "May": "Maio",
          "June": "Junho",
          "July": "Julho",
          "August": "Agosto",
          "September": "Setembro",
          "October": "Outubro",
          "November": "Novembro",
          "December": "Dezembro",
          "No records found for this month":
              "Nenhum registro encontrado para este mês.",
          "Please select a different month.":
              "Por favor, selecione um mês diferente.",
          "Delete all records !": "Eliminar todos os registos!",
          "Are you sure all records will be deleted ?":
              "Tem certeza de que todos os registros serão eliminados?",
          "You deleted all records": "Você eliminou todos os registros.",
          "There are no more records": "Não há mais registros.",

          // FadeNoRecord
          "No record found !": "Registro não encontrado!",

          // ProfileScreen
          "Weight balance": "Equilíbrio de peso",
          "Calculate BMI": "Calcular IMC",
          "Male": "Masculino",
          "Female": "Feminino",
          "NAME": "NOME",
          "TARGET WEIGHT": "PESO ALVO",

          // Controller
          'Graph': 'Gráfico',
          'Line Graph': 'Gráfico de linhas',
          'Bar Graph': 'Gráfico de barras',
          'Error Graph': 'Gráfico de erro',
          'Gallery': 'Galeria',
          'Add': 'Adicionar',
          'History': 'Histórico',
          'Profile': 'Perfil',
          'App': 'Aplicativo',

          // SettingsScreen
          'Language': 'Idioma',
          'Theme': 'Tema',
          'Notifications': 'Notificações',
          'Reminder for process tracking':
              'Lembrete para acompanhamento de processos',
          'Privacy Policy': 'Política de privacidade',
          'Protection of personal data': 'Proteção de dados pessoais',
          'Terms of service': 'Termos de serviço',
          'You have accepted these terms': 'Você aceitou estes termos',
          'Data management': 'Gestão de dados',
          'Data backup, restore and data wipe':
              'Backup de dados, restauração e limpeza de dados',
          'About the app': 'Sobre o aplicativo',
          'Settings': 'Configurações',

          // PrivacyPolicyScreen
          "Privacy Policy": "Política de Privacidade",
          "1. Data Collection": "1. Coleta de Dados",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "O aplicativo FitBalance pode coletar e armazenar os seguintes tipos de dados:\n- Dados de Peso: Armazenamos peso, data, notas e dados de fotos opcionais localmente em seu dispositivo.\n- Fotos: Os usuários podem opcionalmente tirar fotos ou selecioná-las de seus dispositivos para anexar aos registros de peso. Essas fotos são armazenadas apenas em seu dispositivo e não são transmitidas para fora do aplicativo.\n- Peso Alvo: As informações do peso alvo definidas pelo usuário são armazenadas localmente para permitir que os usuários acompanhem suas metas.\n- Dados de IMC (Índice de Massa Corporal): Quando os usuários inserem informações de altura e peso, os cálculos de IMC são realizados. Esses dados também são armazenados apenas localmente.",
          "2. Data Usage": "2. Uso dos Dados",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "Os dados coletados são utilizados exclusivamente para os seguintes fins:\n- Ajudar os usuários a acompanhar seu peso e informações de saúde.\n- Ajudar os usuários a alcançar seus pesos alvo.\n- Mostrar aos usuários o progresso por meio de gráficos e estatísticas.\n- Realizar cálculos de IMC.",
          "3. Data Storage": "3. Armazenamento de Dados",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- Armazenamento Local: Seus dados (peso, notas, fotos) são armazenados no banco de dados local (SQLite) do seu dispositivo. Esses dados permanecem completamente em seu dispositivo sem uma conexão com a Internet. Seus dados nunca são enviados para servidores ou serviços de armazenamento em nuvem.\n- Controle do Usuário: Você pode excluir ou atualizar seus dados a qualquer momento através do aplicativo.",
          "4. Data Sharing": "4. Compartilhamento de Dados",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "O aplicativo FitBalance não compartilha dados coletados com terceiros. Todos os dados são armazenados exclusivamente em seu dispositivo e não são compartilhados fora do aplicativo.",
          "5. User Rights": "5. Direitos do Usuário",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- Você tem o direito de visualizar, atualizar ou excluir seus dados. Essas operações podem ser realizadas diretamente através do aplicativo.\n- Garantimos que seus dados não serão compartilhados com terceiros.",
          "6. Changes to the Privacy Policy":
              "6. Alterações na Política de Privacidade",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "Esta política de privacidade pode ser atualizada de tempos em tempos. Você será notificado sobre alterações significativas por meio de notificações no aplicativo.",
          "7. Contact": "7. Contato",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "Se você tiver alguma dúvida sobre nossa política de privacidade, entre em contato conosco:\n- E-mail: fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': 'Termos de Serviço',
          '1. Acceptance of Terms': '1. Aceitação dos Termos',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              'Ao usar o aplicativo FitBalance, você concorda em cumprir e estar vinculado a estes Termos de Serviço. Se você não concordar com estes termos, não use o aplicativo.',
          '2. User Responsibilities': '2. Responsabilidades do Usuário',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              'Você é responsável por suas próprias ações ao usar o aplicativo. Você não deve:\n'
                  '- Usar o aplicativo para fins ilegais.\n'
                  '- Violação de qualquer lei local, estadual, nacional ou internacional.\n'
                  '- Transmitir qualquer software prejudicial ou malicioso.',
          '3. Intellectual Property': '3. Propriedade Intelectual',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'Todo o conteúdo e materiais disponíveis no aplicativo FitBalance, incluindo texto, gráficos e logotipos, são propriedade da FitBalance ou de seus licenciantes e estão protegidos por direitos autorais, marcas registradas e outras leis de propriedade intelectual.',
          '4. Limitation of Liability': '4. Limitação de Responsabilidade',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance não será responsável por quaisquer danos diretos, indiretos, incidentais, especiais ou consequenciais resultantes do uso ou da incapacidade de usar o aplicativo.',
          '5. Changes to Terms': '5. Alterações aos Termos',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance reserva-se o direito de modificar estes Termos de Serviço a qualquer momento. As alterações serão efetivas após a publicação dos termos revisados no aplicativo.',
          '6. Governing Law': '6. Lei Aplicável',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              'Estes Termos de Serviço serão regidos e interpretados de acordo com as leis da Turquia.',
          '7. Contact Information': '7. Informações de Contato',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              'Se você tiver alguma dúvida sobre estes Termos de Serviço, entre em contato conosco em:\n'
                  '- E-mail: fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              'Ao usar o aplicativo, você concorda com estes termos.',

          // DataManagementScreen
          'Data Management': 'Gerenciamento de Dados',
          'Backup Data': 'Backup de Dados',
          'Restore Data': 'Restaurar Dados',
          'Wipe Data': 'Limpar Dados',

          // AboutTheAppScreen
          'About The App': 'Sobre o Aplicativo',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              'Este aplicativo ajuda você a acompanhar seu peso e analisar seu progresso passo a passo. Você pode adicionar fotos, notas e ver cálculos de IMC para uma análise mais detalhada.',
          'Version: 1.0.0': 'Versão: 1.0.0',
          'Developed by: egedeveloper': 'Desenvolvido por: egedeveloper',
          'Mail: fitbalance.app@gmail.com': 'E-mail: fitbalance.app@gmail.com',
          'You must be healthy !': 'Você deve estar saudável !',

          // BarGraph
          'Averages of the last 1 year': 'Médias do último ano',
          'kg': 'kg',

          // LineGraph
          "all records": "Todos os registros",
          "last 30 days": "Registros dos últimos 30 dias",
          "kg": "kg",
          "All records": "Todos os registros",
          "Records of the last 30 days": "Registros dos últimos 30 dias",

          // RecordListTile
          'note': 'nota',
          'kg': 'kg',

          // DeleteShowDialog
          'Delete': 'Excluir',
          'Cancel': 'Cancelar',

          // RecordScreen
          "kg": "kg",
          "note": "Nota",
          "Edit Record": "Editar Registro",
          "Save": "Salvar",
          "Record updated": "Registro atualizado",
          "Delete Record": "Excluir Registro",
          "Are you sure you want to delete this record ?":
              "Tem certeza de que deseja excluir este registro?",
          "Delete Photo": "Excluir Foto",
          "Are you sure you want to delete this photo ?":
              "Tem certeza de que deseja excluir esta foto?",
          "No photo !": "Nenhuma foto!",

          // ChangeNameScreen
          'Name': 'Nome',
          'Your name': 'Seu nome',
          'Name ?': 'Nome?',
          'Please enter your name': 'Por favor, insira seu nome',
          'You changed your name': 'Você mudou seu nome',

          // ChangeTargetWeightScreen
          'Target Weight': 'Peso alvo',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              'Uma vida saudável começa com os objetivos certos. Escolha seu peso alvo e lembre-se da sua crença em si mesmo a cada passo do caminho.',
          'Your target weight has been updated': 'Seu peso alvo foi atualizado',
          'Good luck': 'Boa sorte',
        },
        'zh_CN': {
          // GraphViewScreen
          'You must pay to see graphs and track your progress in more detail.':
              '您必须付费才能查看图表并更详细地跟踪您的进度。',
          'Payment': '付款',
          'Developer': '开发者',
          'After 1 week of analysis, the graphs appear!': '经过一周的分析，图表出现！',

          // GalleryScreen
          "You don't have any photos yet !": "您还没有照片！",

          // AddScreen
          "There is already a record for the same date": "同一天已经有记录。",
          "Change the date": "更改日期。",
          "note": "备注",
          "YOUR WEIGHT": "您的体重",
          "kg": "千克",
          "Take a photo": "拍照。",
          "Pick from gallery": "从相册中选择。",

          // HistoryScreen
          "Record": "记录",
          "Select Month": "选择月份",
          "January": "一月",
          "February": "二月",
          "March": "三月",
          "April": "四月",
          "May": "五月",
          "June": "六月",
          "July": "七月",
          "August": "八月",
          "September": "九月",
          "October": "十月",
          "November": "十一月",
          "December": "十二月",
          "No records found for this month": "本月未找到记录。",
          "Please select a different month.": "请选择其他月份。",
          "Delete all records !": "删除所有记录！",
          "Are you sure all records will be deleted ?": "您确定要删除所有记录吗？",
          "You deleted all records": "您已删除所有记录。",
          "There are no more records": "没有更多记录。",

          // FadeNoRecord
          "No record found !": "未找到记录！",

          // ProfileScreen
          "Weight balance": "体重平衡",
          "Calculate BMI": "计算BMI",
          "Male": "男性",
          "Female": "女性",
          "NAME": "名字",
          "TARGET WEIGHT": "目标体重",

          // Controller
          'Graph': '图表',
          'Line Graph': '折线图',
          'Bar Graph': '柱状图',
          'Error Graph': '错误图表',
          'Gallery': '图库',
          'Add': '添加',
          'History': '历史',
          'Profile': '个人资料',
          'App': '应用程序',

          // SettingsScreen
          'Language': '语言',
          'Theme': '主题',
          'Notifications': '通知',
          'Reminder for process tracking': '进程跟踪提醒',
          'Privacy Policy': '隐私政策',
          'Protection of personal data': '个人数据保护',
          'Terms of service': '服务条款',
          'You have accepted these terms': '您已接受这些条款',
          'Data management': '数据管理',
          'Data backup, restore and data wipe': '数据备份、恢复和数据清除',
          'About the app': '关于应用程序',
          'Settings': '设置',

          // PrivacyPolicyScreen
          "Privacy Policy": "隐私政策",
          "1. Data Collection": "1. 数据收集",
          "The FitBalance app may collect and store the following types of data:\n- Weight Data: We store weight, date, notes, and optional photo data locally on your device.\n- Photos: Users can optionally take photos or select them from their devices to attach to weight records. These photos are stored only on your device and are not transmitted anywhere outside the app.\n- Target Weight: The user-defined target weight information is stored locally to allow users to track their goals.\n- BMI (Body Mass Index) Data: When users enter height and weight information, BMI calculations are performed. This data is also stored only locally.":
              "FitBalance 应用可能会收集和存储以下类型的数据：\n- 体重数据：我们在您的设备上本地存储体重、日期、备注和可选照片数据。\n- 照片：用户可以选择拍照或从设备中选择照片附加到体重记录。这些照片仅存储在您的设备上，不会传输到应用之外的任何地方。\n- 目标体重：用户定义的目标体重信息被本地存储，以便用户跟踪其目标。\n- BMI（身体质量指数）数据：当用户输入身高和体重信息时，会进行 BMI 计算。这些数据也仅在本地存储。",
          "2. Data Usage": "2. 数据使用",
          "The collected data is used solely for the following purposes:\n- To assist users in tracking their weight and health information.\n- To help users reach their target weights.\n- To show users progress through charts and statistics.\n- To perform BMI calculations.":
              "收集的数据仅用于以下目的：\n- 帮助用户跟踪他们的体重和健康信息。\n- 帮助用户达到他们的目标体重。\n- 通过图表和统计数据向用户显示进展。\n- 进行 BMI 计算。",
          "3. Data Storage": "3. 数据存储",
          "- Local Storage: Your data (weight, notes, photos) is stored in the local database (SQLite) of your device. This data remains completely on your device without an internet connection. Your data is never sent to any servers or cloud storage services.\n- User Control: You can delete or update your data at any time through the app.":
              "- 本地存储：您的数据（体重、备注、照片）存储在您设备的本地数据库（SQLite）中。这些数据在没有互联网连接的情况下完全保留在您的设备上。您的数据永远不会发送到任何服务器或云存储服务。\n- 用户控制：您可以随时通过应用程序删除或更新您的数据。",
          "4. Data Sharing": "4. 数据共享",
          "The FitBalance app does not share collected data with third parties. All data is stored solely on your device and is not shared outside of the application.":
              "FitBalance 应用不会与第三方共享收集的数据。所有数据仅存储在您的设备上，并且不在应用程序之外共享。",
          "5. User Rights": "5. 用户权利",
          "- You have the right to view, update, or delete your data. These operations can be performed directly through the app.\n- We guarantee that your data will not be shared with third parties.":
              "- 您有权查看、更新或删除您的数据。这些操作可以通过应用程序直接执行。\n- 我们保证您的数据不会与第三方共享。",
          "6. Changes to the Privacy Policy": "6. 隐私政策的变更",
          "This privacy policy may be updated from time to time. You will be notified of significant changes through in-app notifications.":
              "本隐私政策可能会不时更新。您将通过应用内通知获知重大变更。",
          "7. Contact": "7. 联系方式",
          "If you have any questions regarding our privacy policy, please contact us:\n- Email: fitbalance.app@gmail.com":
              "如果您对我们的隐私政策有任何疑问，请联系我们：\n- 电子邮件：fitbalance.app@gmail.com",

          // TermsOfServiceScreen
          'Terms of Service': '服务条款',
          '1. Acceptance of Terms': '1. 接受条款',
          'By using the FitBalance application, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, please do not use the application.':
              '使用 FitBalance 应用程序即表示您同意遵守并受这些服务条款的约束。如果您不同意这些条款，请不要使用该应用程序。',
          '2. User Responsibilities': '2. 用户责任',
          'You are responsible for your own actions while using the application. You must not:\n'
                  '- Use the application for any unlawful purpose.\n'
                  '- Violate any local, state, national, or international laws.\n'
                  '- Transmit any harmful or malicious software.':
              '在使用该应用程序时，您对自己的行为负责。您不得：\n'
                  '- 将该应用程序用于任何非法目的。\n'
                  '- 违反任何地方、州、国家或国际法律。\n'
                  '- 传播任何有害或恶意软件。',
          '3. Intellectual Property': '3. 知识产权',
          'All content and materials available on the FitBalance application, including text, graphics, and logos, are the property of FitBalance or its licensors and are protected by copyright, trademark, and other intellectual property laws.':
              'FitBalance 应用程序上提供的所有内容和材料，包括文本、图形和徽标，均为 FitBalance 或其许可方的财产，并受版权、商标和其他知识产权法的保护。',
          '4. Limitation of Liability': '4. 责任限制',
          'FitBalance shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use of or inability to use the application.':
              'FitBalance 对于因使用或无法使用该应用程序而导致的任何直接、间接、偶然、特殊或后果性损害不承担任何责任。',
          '5. Changes to Terms': '5. 条款变更',
          'FitBalance reserves the right to modify these Terms of Service at any time. Changes will be effective upon posting the revised terms in the application.':
              'FitBalance 保留随时修改这些服务条款的权利。更改将在应用程序中发布修订条款时生效。',
          '6. Governing Law': '6. 管辖法律',
          'These Terms of Service shall be governed by and construed in accordance with the laws of Turkey.':
              '这些服务条款应受土耳其法律管辖并根据其进行解释。',
          '7. Contact Information': '7. 联系信息',
          'If you have any questions regarding these Terms of Service, please contact us at:\n'
                  '- Email: fitbalance.app@gmail.com':
              '如果您对这些服务条款有任何疑问，请通过以下方式与我们联系：\n'
                  '- 电子邮件：fitbalance.app@gmail.com',
          'By using the application, you agree to these terms.':
              '使用该应用程序即表示您同意这些条款。',

          // DataManagementScreen
          'Data Management': '数据管理',
          'Backup Data': '备份数据',
          'Restore Data': '恢复数据',
          'Wipe Data': '清除数据',

          // AboutTheAppScreen
          'About The App': '关于应用程序',
          'FitBalance': 'FitBalance',
          'This app helps you track your weight and analyze your progress step by step. You can add photos, notes, and see BMI calculations for a more detailed analysis.':
              '此应用程序帮助您跟踪体重并逐步分析进展。您可以添加照片、笔记，并查看 BMI 计算以进行更详细的分析。',
          'Version: 1.0.0': '版本：1.0.0',
          'Developed by: egedeveloper': '开发者：egedeveloper',
          'Mail: fitbalance.app@gmail.com': '邮箱：fitbalance.app@gmail.com',
          'You must be healthy !': '您必须健康！',

          // BarGraph
          'Averages of the last 1 year': '过去一年的平均值',
          'kg': '千克',

          // LineGraph
          "all records": "所有记录",
          "last 30 days": "最近30天的记录",
          "kg": "千克",
          "All records": "所有记录",
          "Records of the last 30 days": "最近30天的记录",

          // RecordListTile
          'note': '备注',
          'kg': '千克',

          // DeleteShowDialog
          'Delete': '删除',
          'Cancel': '取消',

          // RecordScreen
          "kg": "千克",
          "note": "备注",
          "Edit Record": "编辑记录",
          "Save": "保存",
          "Record updated": "记录已更新",
          "Delete Record": "删除记录",
          "Are you sure you want to delete this record ?": "您确定要删除此记录吗？",
          "Delete Photo": "删除照片",
          "Are you sure you want to delete this photo ?": "您确定要删除此照片吗？",
          "No photo !": "没有照片！",

          // ChangeNameScreen
          'Name': '名字',
          'Your name': '你的名字',
          'Name ?': '名字?',
          'Please enter your name': '请输入您的名字',
          'You changed your name': '你改了你的名字',

          // ChangeTargetWeightScreen
          'Target Weight': '目标体重',
          'A healthy life starts with the right goals. Choose your target weight and remember your belief in yourself every step of the way.':
              '健康的生活从正确的目标开始。选择你的目标体重，并在每一步都记住对自己的信心。',
          'Your target weight has been updated': '你的目标体重已更新',
          'Good luck': '祝你好运',
        },
      };
}
