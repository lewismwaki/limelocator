import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Extension to ``[Widget]`` class to add a red border for debugging purposes.
extension WidgetExtention on Widget {
  Widget debugBorder() {
    if (kDebugMode) {
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: this,
      );
    } else {
      return this;
    }
  }
}

Future<Uint8List> getBytesFromImage(String url) async {
  final response = await HttpClient().getUrl(Uri.parse(url));
  final bytes = await response.close().then(
        (response) => response.fold<Uint8List>(
          Uint8List(0),
          (previous, current) => Uint8List.fromList(previous + current),
        ),
      );
  return bytes;
}
