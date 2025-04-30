import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecurityBlockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.security,
                size: 64,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Text(
                'Security Risk Detected',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'This device appears to be rooted or jailbroken. For your security, this app cannot run on compromised devices.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Exit App'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}