import 'dart:convert';
import 'dart:io';
import 'package:bliss_flutter/global/dev_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bliss_flutter/data_models/items_model.dart';
import 'package:toast/toast.dart';

///API request to retrieve item data
Future<ItemsData> getAllData(context) async {
  ItemsData data;
  try {
    final response = await http.get(
      GET_ALL_ITEMS,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      data = ItemsData.fromJson(items);
    } else {
      Toast.show("Server error", context,
          backgroundColor: Colors.red, textColor: Colors.white);
    }
  } catch (e) {
    Toast.show("Server error", context,
        backgroundColor: Colors.red, textColor: Colors.white);
  }
  return data;
}
