import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_firebase/modules/app_widget.dart';
import 'package:login_firebase/shared/notification_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
          create: (context) => NotificationService(),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
