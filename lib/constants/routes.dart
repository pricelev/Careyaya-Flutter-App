import 'package:careyaya/ui/screens/application.screen.dart';
import 'package:careyaya/ui/screens/auth/auth.screen.dart';
import 'package:careyaya/ui/screens/auth/login.screen.dart';
import 'package:careyaya/ui/screens/auth/register.screen.dart';
import 'package:careyaya/ui/screens/chat.screen.dart';
import 'package:careyaya/ui/screens/chat_list.screen.dart';
import 'package:careyaya/ui/screens/session_list.screen.dart';
import 'package:careyaya/ui/screens/session.screen.dart';
import 'package:careyaya/ui/screens/settings.screen.dart';
import 'package:careyaya/ui/screens/splash.screen.dart';
import 'package:careyaya/ui/screens/session.screen.dart';
import 'package:get/get.dart';

const String SPLASH_ROUTE = '/';
const String AUTH_ROUTE = '/auth';
const String LOGIN_ROUTE = '/login';
const String REGISTER_ROUTE = '/register';
const String CHATS_ROUTE = '/chats';
const String CHAT_ROUTE = '/chat';
const String SESSIONS_ROUTE = '/sessions';
const String SESSION_ROUTE = '/session';
const String SETTINGS_ROUTE = '/settings';
const String APPLICATION_ROUTE = '/application';
const String SESSION_SCREEN_ROUTE = '/sessionScreen';

const List<String> UNAUTHENTICATED_ROUTES = [
  SPLASH_ROUTE,
  AUTH_ROUTE,
  LOGIN_ROUTE,
  REGISTER_ROUTE,
];

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: SPLASH_ROUTE, page: () => SplashScreen()),
    GetPage(name: AUTH_ROUTE, page: () => AuthScreen()),
    GetPage(name: LOGIN_ROUTE, page: () => LoginScreen()),
    GetPage(name: REGISTER_ROUTE, page: () => RegisterScreen()),
    GetPage(name: CHATS_ROUTE, page: () => ChatListScreen(), title: 'Messages'),
    GetPage(name: CHAT_ROUTE, page: () => ChatScreen()),
    GetPage(name: SESSIONS_ROUTE, page: () => SessionListScreen()),
    GetPage(name: SESSION_ROUTE, page: () => SessionScreen()),
    // GetPage(name: '/signup', page: () => SignUpUI()),
    GetPage(name: APPLICATION_ROUTE, page: () => ApplicationScreen()),
    GetPage(name: SETTINGS_ROUTE, page: () => SettingsScreen()),
    // GetPage(name: '/reset-password', page: () => ResetPasswordUI()),
    // GetPage(name: '/update-profile', page: () => UpdateProfileUI()),
    GetPage(name: SESSION_SCREEN_ROUTE, page: () => SessionScreen()),
  ];
}
