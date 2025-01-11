import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<Map<String, String?>> initPlatformState() async {
    late Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } catch (_) {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    String? deviceId = "";
    String? deviceName = "";
    var platform = "";
    String? model = "";
    var version = "1";

    if (Platform.isAndroid) {
      deviceId = deviceData['androidId'];
      deviceName = deviceData['brand'];
      model = deviceData['model'];
      version = deviceData['version.release']; // Use actual version
      platform = "android";
    } else {
      deviceId =
          deviceData['identifierForVendor']; // Use identifierForVendor for iOS
      deviceName = deviceData['name'];
      model = deviceData['model'];
      version = deviceData['systemVersion']; // Use actual version
      platform = "ios";
    }

    final Map<String, String?> mydataDevice = {
      "device_id": deviceId,
      "device_name": deviceName,
      "os": platform,
      "version": version,
      "mobile": deviceName,
      "Model": model,
    };

    return mydataDevice;
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.codename': build.version.codename,
      'board': build.board,
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

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname': data.utsname.sysname,
      'utsname.nodename': data.utsname.nodename,
      'utsname.release': data.utsname.release,
      'utsname.version': data.utsname.version,
      'utsname.machine': data.utsname.machine,
    };
  }
}
