//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars

import 'package:connectivity_plus_web/connectivity_plus_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:device_info_plus_web/device_info_plus_web.dart';
//import 'package:firebase_core_web/firebase_core_web.dart';
//import 'package:firebase_messaging_web/firebase_messaging_web.dart';
import 'package:geolocator_web/geolocator_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  ConnectivityPlusPlugin.registerWith(registrar);
  //DeviceInfoPlusPlugin.registerWith(registrar);
  //FirebaseCoreWeb.registerWith(registrar);
  //FirebaseMessagingWeb.registerWith(registrar);
  GeolocatorPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
