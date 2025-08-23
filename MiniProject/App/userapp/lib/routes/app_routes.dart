import 'package:flutter/material.dart';
import 'package:userapp/screens/create_post_screen.dart';
import 'package:userapp/screens/edit_post_screen.dart';
import 'package:userapp/screens/login_screen.dart';
import 'package:userapp/screens/posts_screen.dart';
import 'package:userapp/screens/signup_screen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String posts = '/posts';
  static const String createPost = '/create_post';
  static const String editPost = '/edit_post';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      signup: (context) => SignupScreen(),
      posts: (context) => PostsScreen(),
      initial: (context) => PostsScreen(),
      createPost: (context) => CreatePostScreen(),
      editPost: (context) => EditPostScreen(),
    };
  }

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final routes = getRoutes();
    WidgetBuilder? builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    // Handle unknown routes
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
      settings: settings,
    );
  }
}
