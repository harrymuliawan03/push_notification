import 'package:flutter/material.dart';
import 'package:flutter_push_notification/another_page.dart';
import 'package:flutter_push_notification/home.dart';
import 'package:flutter_push_notification/local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  bool isRedirect = false;
  String? payload;
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await Permission.notification.request();
  final tes = await LocalNotifications.notificationsPlugin
      .getNotificationAppLaunchDetails();
  // print(tes!.notificationResponse?.payload);

  if (tes!.notificationResponse?.payload != null) {
    isRedirect = true;
    payload = tes.notificationResponse?.payload;
  }
  runApp(MyApp(
    isRedirect: isRedirect,
    payload: payload,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isRedirect, this.payload});
  final bool isRedirect;
  final String? payload;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isRedirect
          ? AnotherPage(
              payload: payload!,
            )
          : Home(),
    );
  }
}
