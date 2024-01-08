import 'package:ea8_magbanua_cpe31/screens/location_screen.dart';

import 'package:flutter/material.dart';

import 'package:ea8_magbanua_cpe31/services/networking.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitHourGlass(
        size: 100.0,
        color: Colors.white,
      )),
    );
  }


  void getWeatherData() async {
    Networking networking = new Networking();
    String data = await networking.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(data);
    }));
  }
}
