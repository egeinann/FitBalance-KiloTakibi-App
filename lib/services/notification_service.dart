import 'dart:math';
import 'package:cron/cron.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // *** RASTGELE BİLDİRİM MESAJLARI
  final List<String> notificationMessages = [
    'Log your weight today!',
    'Track your progress!',
    'Don’t forget to weigh in!',
    'How’s your weight goal?',
    'Keep it up!',
    'Update your weight now!',
    'Eat healthy today?',
  ];

  // BİLDİRİMLERİ BAŞLAT INITIALIZE ***
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
    final cron = Cron(); 
    cron.schedule(Schedule.parse('00 18 * * *'), () async {
      // bu kısımdan bilidirm saatleri ayarlanabilir
      await showRandomNotification();
    });
  }

  // *** RASTGELE MESAJ SEÇ ***
  String _getRandomNotificationMessage() {
    final random = Random();
    return notificationMessages[random.nextInt(notificationMessages.length)];
  }

  // *** TEST ETMEK İÇİN HEMEN BİLDİRİM GÖSTER ***
  Future<void> showRandomNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'daily_notification_channel',
      'Daily Notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Fit Balance',
      _getRandomNotificationMessage(),
      platformChannelSpecifics,
    );
  }

  // *** BİLDİRİM İZNİ İSTEME *** zorunlu ise kullanılabilir
  Future<bool> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      status = await Permission.notification.request();
    }
    return status.isGranted;
  }
}
