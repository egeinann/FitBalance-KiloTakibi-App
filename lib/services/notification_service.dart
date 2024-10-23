import 'dart:math'; // Rastgele sayı üretmek için gerekli
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // List of notification messages
  final List<String> notificationMessages = [
    'Log your weight today!'.tr,
    'Track your progress!'.tr,
    'Don’t forget to weigh in!'.tr,
    'How’s your weight goal?'.tr,
    'Keep it up!'.tr,
    'Update your weight now!'.tr,
    'Eat healthy today?'.tr,
  ];

  // Servisi başlatıyoruz (initialize)
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones(); // Zaman dilimlerini başlat
    await requestNotificationPermission(); // Bildirim izni iste
    await scheduleDailyNotification(); // Bildirimleri zamanla
  }

  // Günlük 18:00'de bildirim kurduk
  Future<void> scheduleDailyNotification() async {
    // Kesin alarmlar için izin kontrolü
    if (await _requestExactAlarmPermission()) {
      final randomMessage =
          _getRandomNotificationMessage(); // Rastgele mesaj aldık
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

      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Fit Balance',
        randomMessage,
        _nextInstanceOfSixPM(),
        platformChannelSpecifics,
        androidAllowWhileIdle:
            true, // Uygulama uyku halinde iken bildirim gönder
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time, // Her gün aynı saatte
      );
    } else {
      print('Kesin alarm izni verilmedi.');
    }
  }

  // Rastgele bildirim mesajı seçtik
  String _getRandomNotificationMessage() {
    final random = Random();
    return notificationMessages[random.nextInt(notificationMessages.length)];
  }

  // Bildirimleri iptal ettik
  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // 18:00 saatinin zamanını hesaplar
  tz.TZDateTime _nextInstanceOfSixPM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, 20, 15); // Saat 18:00 olarak ayarlandı

    // Eğer şu anki zaman 18:00'ü geçtiyse yarına ayarla
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    print(
        "Next scheduled notification time: $scheduledDate"); // Zamanı konsola yazdır
    print("bildirim gönderildi");
    return scheduledDate;
  }

  // Kesin alarm izni isteme
  Future<bool> _requestExactAlarmPermission() async {
    var status = await Permission.ignoreBatteryOptimizations.request();
    return status.isGranted;
  }

  // Test aşamasında cihaza hemen bildirim göndermek için bir fonksiyon yazdık
  Future<void> showInstantNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'instant_notification_channel', 'Instant Notifications',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // ID
      'Fit Balance', // Başlık
      _getRandomNotificationMessage(), // listeden rastgele bir mesaj
      platformChannelSpecifics, // Bildirim özellikleri
    );
    print("bildirim gönderildi");
  }

  // Bildirim izni istiyoruz
  Future<bool> requestNotificationPermission() async {
    try {
      // Öncelikle mevcut durumu kontrol et
      var status = await Permission.notification.status;

      if (status.isGranted) {
        return true; // Zaten izin verilmiş
      } else {
        // İzin iste
        status = await Permission.notification.request();
        // İzin verildiyse true, verilmediyse false döndür
        return status == PermissionStatus.granted;
      }
    } catch (e) {
      print('Hata: $e'); // Hata durumunu konsola yazdır
      return false; // Hata durumunda false döndür
    }
  }
}
