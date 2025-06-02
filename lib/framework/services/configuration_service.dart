// ignore_for_file: avoid_print
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationService {
  static SharedPreferences? _prefs;
  static String serverUrl = "http://qa-1.astroclass.com";
  // static String serverUrl = "http://app.astroclass.com";
  static String? userFirstName = '', userLastName = '', userEmail = '';
  static String? username = "";
  static String? password = "";
  static String? token = '';
  static bool isWalkthroughOpened = false;
  static int? tenantId = 0;
  static String? tenantName = '';
  static bool canStorePassword = true;
  static bool isLoggedIn = false;
  static String userLoggedInModel = "";
  static Future init() async => _prefs = await SharedPreferences.getInstance();
}
