import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform, File;

class SecurityUtils {
  static Future<bool> isDeviceCompromised() async {
    // Handle web platform
    if (kIsWeb) {
      return false; // Web platform is considered safe for this context
    }

    try {
      // Basic jailbreak/root detection
      final isJailBroken = await FlutterJailbreakDetection.jailbroken;
      final isDevelopmentMode = await FlutterJailbreakDetection.developerMode;
      
      // Device info checks
      final deviceInfo = DeviceInfoPlugin();
      bool isEmulator = false;
      
      if (!kIsWeb && Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        isEmulator = !androidInfo.isPhysicalDevice;
        
        final hasRootApps = await _checkForRootApps();
        final hasRootPaths = await _checkForRootPaths();
        
        return isJailBroken || isEmulator || 
               isDevelopmentMode || 
               hasRootApps || hasRootPaths;
      } else if (!kIsWeb && Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        isEmulator = !iosInfo.isPhysicalDevice;
        
        return isJailBroken || isEmulator || isDevelopmentMode;
      }
      
      return false;
    } catch (e) {
      // If any detection fails, assume device is compromised
      return true;
    }
  }

  static Future<bool> _checkForRootApps() async {
    if (kIsWeb) return false;
    
    final suspiciousApps = [
      "com.noshufou.android.su",
      "com.thirdparty.superuser",
      "eu.chainfire.supersu",
      "com.topjohnwu.magisk",
      "com.koushikdutta.superuser",
      "com.zachspong.temprootremovejb",
      "com.ramdroid.appquarantine",
      "com.devadvance.rootcloak",
      "com.amphoras.hidemyroot",
      "com.saurik.substrate"
    ];

    try {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      return suspiciousApps.any((app) => deviceInfo.systemFeatures.contains(app));
    } catch (e) {
      return true;
    }
  }

  static Future<bool> _checkForRootPaths() async {
    if (kIsWeb) return false;
    
    final suspiciousPaths = [
      "/system/app/Superuser.apk",
      "/system/xbin/su",
      "/system/bin/su",
      "/sbin/su",
      "/system/su",
      "/system/bin/.ext/.su",
      "/system/usr/we-need-root/su",
      "/data/local/xbin/su",
      "/data/local/bin/su",
      "/system/sd/xbin/su"
    ];

    try {
      for (final path in suspiciousPaths) {
        if (await File(path).exists()) return true;
      }
    } catch (e) {
      return true;
    }
    return false;
  }

  static Future<Map<String, dynamic>> getDeviceSecurityInfo() async {
    if (kIsWeb) {
      return {
        'platform': 'web',
        'isSecure': true,
      };
    }

    final isJailBroken = await FlutterJailbreakDetection.jailbroken;
    final isDevelopmentMode = await FlutterJailbreakDetection.developerMode;
    final deviceInfo = DeviceInfoPlugin();

    if (!kIsWeb && Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return {
        'isJailBroken': isJailBroken,
        'isDevelopmentMode': isDevelopmentMode,
        'isEmulator': !androidInfo.isPhysicalDevice,
        'hasRootApps': await _checkForRootApps(),
        'hasRootPaths': await _checkForRootPaths(),
        'model': androidInfo.model,
        'manufacturer': androidInfo.manufacturer,
        'androidVersion': androidInfo.version.release,
      };
    } else if (!kIsWeb && Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return {
        'isJailBroken': isJailBroken,
        'isDevelopmentMode': isDevelopmentMode,
        'isEmulator': !iosInfo.isPhysicalDevice,
        'model': iosInfo.model,
        'systemVersion': iosInfo.systemVersion,
      };
    }

    return {'error': 'Unsupported platform'};
  }
}