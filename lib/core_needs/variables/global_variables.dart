import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../data/shared_preference/shared_preference_service.dart';

Logger logger=Logger();
SharedPreferenceService? sharedPreferenceService;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();
