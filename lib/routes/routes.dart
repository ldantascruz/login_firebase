import 'package:flutter/material.dart';
import 'package:login_firebase/modules/home/home_page.dart';
import 'package:login_firebase/modules/login/login_page.dart';
import 'package:login_firebase/modules/notifications/notification_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/home': (_) => const HomePage(),
    '/notificacao': (_) => const NotificacaoPage(),
    '/login': (_) => const LoginPage(),
  };

  static String initial = '/login';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
