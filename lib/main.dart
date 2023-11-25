// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:movie/screens/Home.dart';

void main() {
  runApp(const NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix App',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'devEmma Movie App',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
