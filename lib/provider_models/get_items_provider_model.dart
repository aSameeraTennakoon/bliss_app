import 'package:bliss_flutter/api_requests/get_items.dart';
import 'package:bliss_flutter/data_models/items_model.dart';
import 'package:bliss_flutter/utils/check_network.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ItemsProviderModel with ChangeNotifier {

  ItemsData itemsData;
  bool isLoading = true;

  List<Item> cartList = [];

  Item selectedItem = Item();

  List<Item> bagList = [];
  List<Item> purseList = [];

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
        addToCategory(context,itemsData.data);
        isLoading = false;
        notifyListeners();
      }else{
        Toast.show('Please connect to the Internet', context,
            duration: 2, backgroundColor: Colors.pink);
      }
    });
  }

  setSingleItem(item) => selectedItem = item;

  addToFav(context,fav,index){
    itemsData.data[index].isFav = fav;
    notifyListeners();
  }

  incrementQuant(context,index){
    itemsData.data[index].quantity ++;
    notifyListeners();
  }

  decrementQuant(context,index){
    if(itemsData.data[index].quantity > 0){
      itemsData.data[index].quantity --;
    }
    notifyListeners();
  }

  addToCart(context,item){
    for(Item c in item){
      if(item.modelName == c.modelName){
        return;
      }
    }
    cartList.add(item);
    notifyListeners();
  }

  addToCategory(context,items) {
    for (Item c in items) {
      if (c.category == 'bag'){
        bagList.add(c);
      }else{
        purseList.add(c);
      }
    }
  }
}

