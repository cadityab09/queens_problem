import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queens_problem/model/white_model.dart';


class QueenProblems8 extends StatefulWidget {
  const QueenProblems8({super.key});

  @override
  State<QueenProblems8> createState() => _QueenProblems8State();
}

class _QueenProblems8State extends State<QueenProblems8> {
  List<List<dynamic?>> aliveList = List.generate(8, (_) => List.filled(8, null));
  List<List<dynamic>> colorList = List.generate(8, (_) => List.filled(8, null));
  List<List<int>> arr = List.generate(8, (_) => List.filled(8, 0));
  Map<String, dynamic> queen=WhiteModel.queen;
  bool isSolved=false, disMsg=false;
  String isMoved="end";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      aliveList = List.generate(8, (_) => List.filled(8, null));
    });
    loadData();

  }

  Future<void> waitMin(int r, int c, int i, int j)async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      colorList[r][c]=Colors.redAccent;
      colorList[i][j]=Colors.redAccent;
    });
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      colorList[r][c]=null;
      colorList[i][j]=null;
    });
  }
  Future<void> waitMin2(int r, int c)async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      colorList[r][c]=Colors.greenAccent;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      colorList[r][c]=null;
    });
  }
  Future<void> waitMin3(int r, int c)async{
    setState(() {
      colorList[r][c]=Colors.redAccent;
    });
    await Future.delayed(Duration(milliseconds: 600));
    setState(() {
      colorList[r][c]=null;
    });
  }
  void loadData() async{
    int i, j;
    int r = 0, c = 0;
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      isMoved="show";
    });
    await Future.delayed(Duration(milliseconds: 2000));
    setState(() {
      isMoved="start";
    });

    await Future.delayed(Duration(milliseconds: 1000));
    isSolved=await queen4(r);
    setState(() {
      isSolved=isSolved;
      disMsg=true;
    });

    for (i = 0; i < 4; i++) {
      for (j = 0; j < 4; j++) {
        print(arr[i][j]);
      }
    }
  }

  Future<bool> queen4(int r) async{
    bool b;
    int i, j;

    for (i = 0; i < 8;) {
      setState(() {
        aliveList[r][i]=queen;
      });
      if (await isSafe(r, i)) {
        await waitMin2(r,i);
        arr[r][i] = 1;
        if (r + 1 < 8) {
          b = await queen4(r + 1);
          if (b == true) {
            return true;
          } else {
            arr[r][i] = 0;
            await waitMin3(r,i);
            setState(() {
              aliveList[r][i]=null;
            });
            i++;
          }
        } else {
          return true;
        }
      } else {
        arr[r][i] = 0;
        //await waitMin3(r,i);
        setState(() {
          aliveList[r][i]=null;
        });
        i++;
      }
    }
    return false;
  }

  Future<bool> isSafe(int r, int c) async{
    int i, j;
    for (i = 0; i < r; i++) {
      if (arr[i][c] == 1) {
        await waitMin(r,c,i,c);
        return false;
      }
    }

    // Check upper left diagonal
    for ((i = r, j = c); i >= 0 && j >= 0; i--, j--) {
      if (arr[i][j] == 1) {
        await waitMin(r,c,i,j);
        return false;
      }
    }

    // Check upper right diagonal
    for ((i = r, j = c); i >= 0 && j < 8; i--, j++) {
      if (arr[i][j] == 1) {
        await waitMin(r,c,i,j);
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text('8-Queens Problem', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff764abc),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.46,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.437,
                            width: MediaQuery.of(context).size.width * 0.92,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 8,
                                ),
                                itemCount: 64,
                                itemBuilder: (context, index) {
                                  int row = (index ~/
                                      8); //(MatchView.whiteView)?7-(index ~/ 8):(index ~/ 8);
                                  int dsRow = (index ~/ 8);
                                  int column = index % 8;
                                  //bool isSelected = (row==isSelectedRow && column==isSelectedCol);

                                  return Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: (colorList[row][column] != null)
                                              ? colorList[row][column]
                                              : (((dsRow % 2 == 0 && column % 2 == 0) || (dsRow % 2 != 0 && column % 2 != 0))
                                              ? Colors.white24
                                              : Colors.black26),
                                        ),
                                        child: (aliveList[row][column] != null)
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Image(
                                                    image: AssetImage(
                                                        aliveList[row][column]
                                                            ['image']),
                                                    color: (aliveList[row]
                                                                    [column]
                                                                ['color'] ==
                                                            'white')
                                                        ? Colors.white70
                                                        : Colors.black87,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text((isSolved==true && disMsg==true)?'8-Queens Problem Solved':(disMsg==true)?'8-Queens Problem Not Solved':'', style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            left: (isMoved=="end") ? MediaQuery.of(context).size.width * 1 : (isMoved=="show")? MediaQuery.of(context).size.width * 0.3:-200,
            child: Text("START",style: TextStyle(fontSize: 50, color: Colors.white),),
            onEnd: () {
              // Optional: Trigger an action after the animation ends
            },
          ),
        ],
      ),
    );
  }
}
