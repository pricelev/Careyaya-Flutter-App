import 'package:careyaya/screens/auth/auth.screen.dart';
import 'package:careyaya/screens/sign_in/sign_in.screen.dart';
import 'package:careyaya/screens/chat/chat.screen.dart';
import 'package:careyaya/screens/chat_list/chat_list.screen.dart';
import 'package:careyaya/screens/joygiver_application/joygiver_application.screen.dart';
import 'package:careyaya/screens/loading/loading.screen.dart';
import 'package:careyaya/screens/session/session.screen.dart';
import 'package:careyaya/screens/session_list/session_list.screen.dart';
import 'package:careyaya/screens/settings/settings.screen.dart';
import 'package:get/get.dart';

const String SPLASH_ROUTE = '/';
const String AUTH_ROUTE = '/auth';
const String LOGIN_ROUTE = '/login';
const String CHATS_ROUTE = '/chats';
const String CHAT_ROUTE = '/chat';
const String SESSIONS_ROUTE = '/sessions';
const String SESSION_ROUTE = '/session';
const String SETTINGS_ROUTE = '/settings';
const String APPLY_ROUTE = '/apply';
const String SESSION_REVIEW_ROUTE = '/session_review';

const List<String> UNAUTHENTICATED_ROUTES = [
  SPLASH_ROUTE,
  AUTH_ROUTE,
  LOGIN_ROUTE,
];

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: SPLASH_ROUTE, page: () => LoadingScreen()),
    GetPage(name: AUTH_ROUTE, page: () => AuthScreen()),
    GetPage(name: LOGIN_ROUTE, page: () => LoginScreen()),
    GetPage(name: CHATS_ROUTE, page: () => ChatListScreen(), title: 'Messages'),
    GetPage(name: CHAT_ROUTE, page: () => ChatScreen()),
    GetPage(name: SESSIONS_ROUTE, page: () => SessionListScreen()),
    GetPage(name: SESSION_ROUTE, page: () => SessionScreen()),
    // GetPage(name: '/signup', page: () => SignUpUI()),
    GetPage(name: APPLY_ROUTE, page: () => ApplicationScreen()),
    GetPage(name: SETTINGS_ROUTE, page: () => SettingsScreen()),
    // GetPage(name: '/reset-password', page: () => ResetPasswordUI()),
    // GetPage(name: '/update-profile', page: () => UpdateProfileUI()),
    // GetPage(name: SESSION_REVIEW_ROUTE, page: () => SessionReviewScreen()),
  ];
}
