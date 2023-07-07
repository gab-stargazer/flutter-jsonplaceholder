import 'package:flutter/material.dart';
import 'package:json_placeholder_album/di/module.dart';

import 'MyApp.dart';

void main() async {
  setupDependencies();
  runApp(const MyApp());
}