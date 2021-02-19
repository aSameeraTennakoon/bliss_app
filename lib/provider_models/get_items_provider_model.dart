import 'package:bliss_flutter/api_requests/get_items.dart';
import 'package:bliss_flutter/data_models/items_model.dart';
import 'package:bliss_flutter/utils/check_network.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ItemsProviderModel with ChangeNotifier {

  ItemsData itemsData;
  bool isLoading = true;

  getItemsData(context) {
    checkNetworkStatus(context).then((value) async {
      isLoading = true;
      notifyListeners();
      if (value) {
        await getAllData(context).then((res){
          if(res != null){
            itemsData = res;
          }
        });
        isLoading = false;
        notifyListeners();
      }else{
        Toast.show('Please connect to the Internet', context,
            duration: 2, backgroundColor: Colors.pink);
      }
    });
  }
}