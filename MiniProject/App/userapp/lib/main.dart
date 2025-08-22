import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/posts_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/edit_post_screen.dart';

// Global navigator key for 401 handling
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      navigatorKey: navigatorKey,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/posts': (context) => PostsScreen(),
        '/create_post': (context) => CreatePostScreen(),
        '/edit_post': (context) => EditPostScreen(),
      },
    );
  }
}
