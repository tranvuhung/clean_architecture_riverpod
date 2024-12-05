import 'package:clean_architecture_riverpod/main/app.dart';
import 'package:flutter/services.dart';
import 'package:clean_architecture_riverpod/main/observers.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon();

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.black,
    statusBarBrightness: Brightness.light,
  ));

  runApp(ProviderScope(observers: [
    Observers(),
  ], child: const MyApp()));
}
