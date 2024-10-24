import 'dart:math';
import 'package:cron/cron.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  
  final List<String> notificationMessages = [
    'Log your weight today!',
    'Track your progress!',
    'Don’t forget to weigh in!',
    'How’s your weight goal?',
    'Keep it up!',
    'Update your weight now!',
    'Eat healthy today?',
  ];

  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones(); // Zaman dilimlerini başlat
    
    // Her gün 18:00'da bildirim zamanlama
    final cron = Cron();
    cron.schedule(Schedule.parse('00 18 * * *'), () async {
      await showRandomNotification();
    });
  }

  // Rastgele bildirim mesajı seçtik
  String _getRandomNotificationMessage() {
    final random = Random();
    return notificationMessages[random.nextInt(notificationMessages.length)];
  }

  // Bildirimi hemen göster
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
    print("Bildirim gönderildi");
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
