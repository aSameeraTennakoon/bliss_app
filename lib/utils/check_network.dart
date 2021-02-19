import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Future checkNetworkStatus(BuildContext context) async {
  bool status = false;

  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      status = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = true;
    } else {
      Toast.show('Please connect to the Internet', context,
          duration: 2, backgroundColor: Colors.pink);
    }
  } catch (e) {
    print(e);
  }

  return status;
}
