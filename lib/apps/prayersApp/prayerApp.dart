// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/authentication/login/login.dart';
import '../../core/reactiveModels.dart';
import 'features/home/home.dart';

class PrayersApp extends ReactiveStatelessWidget {
  const PrayersApp({super.key});

  @override
  Widget build(BuildContext context) => authenticated ? Home() : LoginForm();
}



/// init start set loading
/// users init
/// data init
/// user init
/// loading screen
/// login
/// register
/// homeScreen


