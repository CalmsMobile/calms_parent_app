// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '/common/alert_dialog.dart';
import '/common/app_settings.dart';
import '/common/my_shared_pref.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class RestApiProvider {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  Future<Map<String, dynamic>> postMethod(
      data, apiURL, endPoint, context, showProgress, allowAuth) async {
    ProgressDialog _progressDialog = ProgressDialog(context: context);
    if (showProgress) {
      _progressDialog.show(max: 100, msg: 'Loading...please wait...');
    }

    String deviceUID = await MySharedPref().getData(AppSettings.deviceUID);
    if (deviceUID == '') {
      initPlatformState();
    }

    String driverDetails =
        await MySharedPref().getData(AppSettings.parentDetails);

    var driverData_;
    if (driverDetails != "") {
      var driverDataList_ = jsonDecode(driverDetails);
      List<dynamic> tableList = driverDataList_['Table'];
      Map<String, dynamic> tableObj = tableList[0];
      if (tableObj['Code'] == 10) {
        driverData_ = driverDataList_['Table1'][0];
      }
    }

    if (allowAuth) {
      deviceUID = deviceUID != ""
          ? deviceUID
          : Platform.isAndroid
              ? _deviceData["androidId"]
              : _deviceData["identifierForVendor"];
    }

    data['Authorize'] = {
      'AuDriverSeqId': allowAuth ? driverData_["DriverSeqId"] : "",
      'AuDeviceUID': allowAuth ? (deviceUID != '' ? deviceUID : "WEB") : "WEB"
    };
    print("Param: $data >> API:  $apiURL >> endPoint:  $endPoint");
    if (apiURL == null || apiURL == '') {
      String qrData = await MySharedPref().getData(AppSettings.qrCodeData);
      Map<String, dynamic> qrJson = jsonDecode(qrData);
      apiURL = qrJson['ApiUrl'];
    }
    apiURL = apiURL + endPoint;
    bool isConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      isConnected = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isConnected = true;
    }
    //encode Map to JSON
    if (isConnected) {
      var body = json.encode(data);
      Uri myUri = Uri.parse(apiURL);
      final ioClient = HttpClient();
      ioClient.connectionTimeout = const Duration(seconds: 5);
      http.Response outputResponse;
      try {
        outputResponse = await http.post(myUri,
            headers: {"Content-Type": "application/json"}, body: body);
        if (kDebugMode) {
          print(outputResponse.statusCode);
          print("$endPoint ${outputResponse.body}");
        }

        if (json.decode(outputResponse.body) is Map<String, dynamic>) {
          print("No HTTP resource was found");
          if (showProgress) {
            _progressDialog.close();
          }
          Map<String, dynamic> resObj = {
            "Code": 20,
            "Description": "No HTTP resource was found"
          };
          return Future<Map<String, dynamic>>.value(resObj);
        } else {
          List<dynamic> qrJson = jsonDecode(outputResponse.body) as List;
          if (qrJson.length > 0 && qrJson[0]['Data'] != null) {
            Map<String, dynamic> dataObj = jsonDecode(qrJson[0]['Data']);
            if (dataObj.containsKey("Table")) {
              List<dynamic> tableList = dataObj['Table'];
              Map<String, dynamic> tableObj = tableList[0];
              if (tableObj['Code'] == 10) {
                if (showProgress) {
                  _progressDialog.close();
                }
                return Future<Map<String, dynamic>>.value(dataObj);
              } else {
                print("failed ${tableObj['Code']}");
                if (showProgress) {
                  _progressDialog.close();
                }
                if (tableObj['Code'] == 20 &&
                    (tableObj['Description'] ==
                        "Device Not in Active Status")) {
                  print("Auto Logout calling rest api");
                  MySharedPref().clearAllData();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             LoginScreen(true, tableObj['Description'])));
                  // showlogedOutAlert(context, tableObj['Description']);
                  // tableObj['Code'] = 20;
                } else if ((tableObj['Code'] == "50" ||
                        tableObj['Code'] == "30") ||
                    tableObj['Code'] > 20) {
                  MySharedPref().clearAllData();
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             LoginScreen(true, tableObj['Description'])));
                  // showlogedOutAlert(context, tableObj['Description']);
                  // tableObj['Code'] = 20;
                }
                tableObj['Code'] = "30";
                return Future<Map<String, dynamic>>.value(tableObj);
              }
            } else {
              if (showProgress) {
                _progressDialog.close();
              }
              Map<String, dynamic> resObj = {
                "Code": 20,
                "Description": "Data is empty"
              };
              return Future<Map<String, dynamic>>.value(resObj);
            }
          } else {
            if (showProgress) {
              _progressDialog.close();
            }
            Map<String, dynamic> dataErrorObj = qrJson[0];
            var status = dataErrorObj['Status'];
            print(status);
            if (!status) {
              Map<String, dynamic> resObj = {
                "Code": 20,
                "Description": dataErrorObj['ErrorLog'][0]['Error']
              };
              return Future<Map<String, dynamic>>.value(resObj);
            } else {
              Map<String, dynamic> resObj = {
                "Code": 20,
                "Description": "Error"
              };
              return Future<Map<String, dynamic>>.value(resObj);
            }
          }
        }
      } on SocketException {
        if (showProgress) {
          _progressDialog.close();
        }
        Map<String, dynamic> resObj = {
          "Code": 20,
          "Description": "Network Error"
        };
        return Future<Map<String, dynamic>>.value(resObj);
      } catch (err) {
        print("Error catch api $err");
        if (showProgress) {
          _progressDialog.close();
        }
        Map<String, dynamic> resObj = {
          "Code": 20,
          "Description": err.toString()
        };
        return Future<Map<String, dynamic>>.value(resObj);
      }
    } else {
      if (showProgress) {
        _progressDialog.close();
      }
      Map<String, dynamic> resObj = {
        "Code": 20,
        "Description": "Network Error"
      };
      return Future<Map<String, dynamic>>.value(resObj);
    }
  }

  Future<Map<String, dynamic>> postData(
      data, apiURL, endPoint, context, showProgress, allowAuth) async {
    apiURL = apiURL + endPoint;
    ProgressDialog _progressDialog = ProgressDialog(context: context);
    if (showProgress) {
      _progressDialog.show(max: 100, msg: 'Loading...please wait...');
    }
    bool isConnected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      isConnected = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isConnected = true;
    }
    String body = json.encode(data);

    if (isConnected) {
      final response = await http.post(
        Uri.parse(apiURL),
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        if (showProgress) {
          _progressDialog.close();
        }
        //var jsonData = json.decode(response.body);
        //Map<String, dynamic> map = jsonDecode(jsonData[0]['Data']);
        List<dynamic> qrJson = jsonDecode(response.body) as List;
        if (qrJson.length > 0 && qrJson[0]['Data'] != null) {
          Map<String, dynamic> dataObj = jsonDecode(qrJson[0]['Data']);
          if (dataObj.containsKey("Table")) {
            List<dynamic> tableList = dataObj['Table'];
            Map<String, dynamic> tableObj = tableList[0];
            if (tableObj['code'] == 10 || tableObj['Code'] == 10) {
              return Future<Map<String, dynamic>>.value(dataObj);
            } else if (endPoint == AppSettings.RegisterParentApp &&
                    tableObj['code'] == 40 ||
                tableObj['Code'] == 40) {
              return Future<Map<String, dynamic>>.value(dataObj);
            } else {
              print("failed ${tableObj['code'] || tableObj['Code']} ");

              return throw Exception(tableObj['description']);
            }
          } else {
            throw Exception('Something went wrong.');
          }
        } else {
          throw Exception('Something went wrong.');
        }
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        if (showProgress) {
          _progressDialog.close();
        }
        throw Exception('Something went wrong.');
      }
    } else {
      if (showProgress) {
        _progressDialog.close();
      }
      throw Exception('Failed to connect network.');
    }
  }

  showlogedOutAlert(BuildContext context, String message) {
    MyCustomAlertDialog()
        .showCustomAlert(context, "Notification", message, false, () {
      Navigator.pop(context);
    }, null);
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          deviceData =
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    MySharedPref()
        .saveData(jsonEncode(deviceData), AppSettings.mobileDeviceInfo);
    _deviceData = deviceData;

    String deviceUID = Platform.isAndroid
        ? _deviceData["androidId"]
        : _deviceData["identifierForVendor"];

    MySharedPref().saveData(deviceUID, AppSettings.deviceUID);
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.id,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };
  }
}
