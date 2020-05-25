import 'dart:io';

class Utility{

  static bool isEmpty(String val) {
    return (val != null && val.isNotEmpty) ? false : true;
  }

  static Future<bool> onCheckNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      else
        return false;
    } on SocketException catch (_) {
      return false;
    }
  }

}