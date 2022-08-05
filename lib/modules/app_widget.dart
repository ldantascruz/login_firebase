import 'package:flutter/material.dart';
import 'package:login_firebase/routes/routes.dart';
import 'package:login_firebase/shared/notification_service.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    checkNotifications();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.list,
      initialRoute: Routes.initial,
      navigatorKey: Routes.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFCEC5F)),
        primaryColor: const Color(0xffFCEC5F),
        focusColor: const Color(0xffFCEC5F),
        iconTheme: const IconThemeData(color: Color(0xffFCEC5F)),
        primaryIconTheme: const IconThemeData(color: Color(0xffFCEC5F)),
      ),
    );
  }
}
