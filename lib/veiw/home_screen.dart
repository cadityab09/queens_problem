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
        title: Text('Queens Problem', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QueenProblems4()),
                );
              },
              child: Container(
                width: 250, // Width of the button
                height: 60, // Height of the button
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Text(
                  '4-Queens Problem',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 20, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QueenProblems8()),
                );
              },
              child: Container(
                width: 250, // Width of the button
                height: 60, // Height of the button
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: Text(
                  '8-Queens Problem',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 20, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );;
  }
}
