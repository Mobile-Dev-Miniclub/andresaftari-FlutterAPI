import 'package:flutter/material.dart';
import 'package:latian_api/pages/pages.dart';

void main() => runApp(HttpApp());

class HttpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http Demo',
      home: MainNavigation(),
    );
  }
}
