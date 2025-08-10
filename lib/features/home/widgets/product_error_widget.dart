import 'package:flutter/material.dart';

Widget productErrorWidget() {
  return Container(
    color: Colors.white,
    child: Icon(
      Icons.image_not_supported_rounded,
      size: 40,
      color: Colors.white.withValues(alpha: 0.3),
    ),
  );
}
