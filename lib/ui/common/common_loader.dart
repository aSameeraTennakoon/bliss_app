import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

///common widget for loading animations
Widget loadingAnimation() {
  return LoadingBouncingGrid.square(
    backgroundColor: Colors.pinkAccent,
    size: 50.0,
  );
}
