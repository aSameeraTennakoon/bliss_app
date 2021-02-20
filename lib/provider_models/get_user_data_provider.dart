import 'package:bliss_flutter/api_requests/get_user_data.dart';
import 'package:bliss_flutter/data_models/user_data.dart';
import 'package:bliss_flutter/utils/check_network.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UserDataProviderModel with ChangeNotifier {
  UserData userData;
  bool isLoading = true;

  getUserData(context) {
    checkNetworkStatus(context).then((value) async {
      isLoading = true;
      notifyListeners();
      if (value) {
        await getAppUserData(context).then((res) {
          if (res != null) {
            userData = res;
          }
        });
        isLoading = false;
        notifyListeners();
      } else {
        Toast.show('Please connect to the Internet', context,
            duration: 2, backgroundColor: Colors.pink);
      }
    });
  }
}
