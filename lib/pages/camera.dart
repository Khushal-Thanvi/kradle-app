import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Camera Feed',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: "DeliusSwashCaps",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This feature is still under development",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
                ),
              ),
              SizedBox(height: 25,),
              Text(
                "Please wait for future updates",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}