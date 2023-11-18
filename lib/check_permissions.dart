import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckPermission {
  Future<bool> isStoragePermission() async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var re = await Permission.manageExternalStorage.request();
      if (re.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await Permission.storage.isGranted) {
        return true;
      } else {
        var result = await Permission.storage.request();
        if (result.isGranted) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
}
