import 'package:flutter/material.dart';
import 'package:queens_problem/veiw/queen_problems_4.dart';
import 'package:queens_problem/veiw/queen_problems_8.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Queens Problem',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                backgroundColor: Colors.blue, // Background color
              ),
              onPressed: () async{
                await Future.delayed(Duration(seconds: 1));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QueenProblems4()),
                );
              },
              child: const Text(
                '4-Queens Problem',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20, // Text size
                  fontWeight: FontWeight.bold, // Text weight
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                backgroundColor: Colors.green, // Background color
              ),
              onPressed: () async{
                await Future.delayed(Duration(seconds: 1));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QueenProblems8()),
                );
              },
              child: const Text(
                '8-Queens Problem',
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20, // Text size
                  fontWeight: FontWeight.bold, // Text weight
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
