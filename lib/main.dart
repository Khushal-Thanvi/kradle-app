import 'package:flutter/material.dart';
import 'package:kradle/pages/camera.dart';
import 'package:kradle/pages/login.dart';
import 'package:kradle/pages/dashboard.dart';
import 'package:kradle/pages/music.dart';
import 'package:kradle/pages/scare.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp( MaterialApp(
    builder: FToastBuilder(),
    initialRoute: '/',
    routes: {
      '/' : (context) => const Login(),
      '/dashboard' : (context) => const Dashboard(),
      '/scare' : (context) => const Scare(),
      '/music' : (context) => const MusicPage(),
      '/camera' : (context) => const CameraPage()
    },
  ));
}
