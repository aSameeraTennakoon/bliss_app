import 'package:bliss_flutter/provider_models/get_items_provider_model.dart';
import 'package:bliss_flutter/provider_models/get_user_data_provider.dart';
import 'package:bliss_flutter/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bliss',
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen()
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserDataProviderModel>(create: (_) => UserDataProviderModel()),
  ChangeNotifierProvider<ItemsProviderModel>(create: (_) => ItemsProviderModel()),
];