import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildProductImageShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    period: const Duration(milliseconds: 1200),
    child: Container(
      height: 160,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
    ),
  );
}
