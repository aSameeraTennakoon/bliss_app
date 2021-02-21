import 'package:bliss_flutter/api_requests/get_items.dart';
import 'package:bliss_flutter/data_models/items_model.dart';
import 'package:bliss_flutter/utils/check_network.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ItemsProviderModel with ChangeNotifier {
  ItemsData itemsData;
  bool isLoading = true;

  List<Item> cartList = [];
  List<Item> searchList = [];

  Item selectedItem = Item();

  List<Item> bagList = [];
  List<Item> purseList = [];
  double total = 0.0;

  ///the list of items from API
  getItemsData(context) {
    checkNetworkStatus(context).then((value) async {
      isLoading = true;
      notifyListeners();
      if (value) {
        await getAllData(context).then((res) {
          if (res != null) {
            itemsData = res;
          }
        });
        addToCategory(context, itemsData.data);
        isLoading = false;
        notifyListeners();
      } else {
        Toast.show('Please connect to the Internet', context,
            duration: 2, backgroundColor: Colors.pink);
      }
    });
  }

  ///set navigating item as the single item from the list
  setSingleItem(item) => selectedItem = item;

  ///adding single item to favourites/ set as favourite
  addToFav(context, fav, index) {
    itemsData.data[index].isFav = fav;
    notifyListeners();
  }

  ///increase the quantity of a single item
  incrementQuant(context, index) {
    itemsData.data[index].quantity++;
    notifyListeners();
  }

  ///decrease the quantity of a single item
  decrementQuant(context, index) {
    if (itemsData.data[index].quantity > 0) {
      itemsData.data[index].quantity--;
    }
    notifyListeners();
  }

  ///add single item to cart
  addToCart(context, item) {
    if (cartList.contains(item)) {
    } else {
      cartList.add(item);
      print("cart length ${cartList.length.toString()}");
    }
    notifyListeners();
  }

  ///remove item from the cart
  removeFromCart(context, item) {
    if (cartList.contains(item)) {
      cartList.remove(item);
      calculateTotal(context);
      notifyListeners();
    }
  }

  ///divide items list in to categories
  addToCategory(context, items) {
    for (Item c in items) {
      if (c.category == 'bag') {
        bagList.add(c);
        notifyListeners();
      } else {
        purseList.add(c);
        notifyListeners();
      }
    }
  }

  ///calculate the sum of the items in the cart list
  calculateTotal(context) {
    total = 0;
    for (var i = 0; i < cartList.length; i++) {
      total += double.parse(cartList[i].price) *
          double.parse(cartList[i].quantity.toString());
    }
    notifyListeners();
  }

  ///search for a keyword specific item from the items list
  searchItems(context, keyword) {
    searchList.clear();
    for (var i = 0; i < itemsData.data.length; i++) {
      if (itemsData.data[i].modelName == keyword) {
        searchList.add(itemsData.data[i]);
        print(searchList.length);
        notifyListeners();
      }
    }
  }
}
