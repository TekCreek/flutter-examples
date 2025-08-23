import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:userapp/routes/app_routes.dart';
import 'package:userapp/services/auth_service.dart';

// Global navigator key for 401 handling
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  String? token = await AuthService.getToken();
  runApp(MyApp(initialRoute: token == null ? AppRoutes.login : AppRoutes.posts));
}

class MyApp extends StatelessWidget {

  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
