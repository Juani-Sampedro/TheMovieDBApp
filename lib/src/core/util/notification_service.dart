import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final String channelId = 'channelId';
  final String channelName = 'channelName';
  final String imagePath = 'drawable/flutter_logo';
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(imagePath);
    var initializationSettingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (
      int id,
      String? title,
      String? body,
      String? payload,
    ) async {});
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        importance: Importance.max,
      ),
      iOS: const DarwinNotificationDetails(),
    );
  }

  Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      await notificationDetails(),
    );
  }
}
