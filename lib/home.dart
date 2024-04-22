import 'package:flutter/material.dart';
import 'package:flutter_push_notification/another_page.dart';
import 'package:flutter_push_notification/local_notifications.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    listenNotification();
    super.initState();
  }

  // to listen notification clicked or not
  listenNotification() {
    print('listening to notification');
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AnotherPage(payload: event)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter local notifications'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                LocalNotifications.showSimpleNotification(
                    title: 'Testing',
                    body: 'Body notification',
                    payload: 'This is simple notification');
              },
              icon: Icon(Icons.notifications_outlined),
              label: Text('Simple notifications'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                LocalNotifications.showPeriodicNotifications(
                    title: 'Testing',
                    body: 'Body notification',
                    payload: 'This is example');
              },
              icon: Icon(Icons.timer_outlined),
              label: Text('Periodic periodic notification'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                LocalNotifications.showScheduleNotification(
                    title: 'Testing',
                    body: 'Body notification',
                    payload: 'This is schedule notification');
              },
              icon: Icon(Icons.calendar_month_outlined),
              label: Text('Schedule notifications'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                LocalNotifications.cancel(1);
              },
              icon: Icon(Icons.close),
              label: Text('Close periodic notifications'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                LocalNotifications.cancelAll();
              },
              icon: Icon(Icons.close),
              label: Text('Close all notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
