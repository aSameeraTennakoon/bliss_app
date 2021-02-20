import 'dart:convert';
import 'dart:io';
import 'package:bliss_flutter/data_models/user_data.dart';
import 'package:bliss_flutter/global/dev_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

Future<UserData> getAppUserData(context) async {
  UserData data;
  try {
    final response = await http.get(
      GET_USER_DATA,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      data = UserData.fromJson(items);
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
