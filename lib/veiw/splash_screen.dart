import 'dart:async';
import 'package:flutter/material.dart';
import 'package:queens_problem/veiw/home_screen.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/chess_icons/black/king.png',
    'assets/chess_icons/black/queen.png',
    'assets/chess_icons/black/rook.png',
    'assets/chess_icons/black/bishop.png',
    'assets/chess_icons/black/left_knight.png',
    'assets/chess_icons/black/pawn.png',
  ];

  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  void _startSplashSequence() {
    Timer imageTimer = Timer.periodic(
      const Duration(milliseconds: 500),
          (Timer timer) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % _images.length;
        });
      },
    );

    Timer(const Duration(seconds: 5), () {
      imageTimer.cancel(); // Stop the image sequence timer
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: (_currentIndex==0)?Colors.lightBlue:
                (_currentIndex==1)?Colors.yellowAccent:
                (_currentIndex==2)?Colors.purpleAccent:
                (_currentIndex==3)?Colors.cyanAccent:Colors.blueGrey,
                enabled: true,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.width * 0.19,
                      key: ValueKey<int>(_currentIndex),
                      child: Image.asset(
                        _images[1],
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Queens Problem",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
