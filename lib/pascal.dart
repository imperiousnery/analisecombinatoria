import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triângulo de Pascal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PascalTriangleScreen(),
    );
  }
}

class PascalTriangleScreen extends StatefulWidget {
  @override
  _PascalTriangleScreenState createState() => _PascalTriangleScreenState();
}

class _PascalTriangleScreenState extends State<PascalTriangleScreen> {
  List<List<int>> pascalTriangle = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triângulo de Pascal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Insira o número de linhas do triângulo:',
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  int rows = int.tryParse(value) ?? 0;
                  generatePascalTriangle(rows);
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var row in pascalTriangle)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var number in row)
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(number.toString()),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void generatePascalTriangle(int rows) {
    List<List<int>> triangle = [];
    for (int i = 0; i < rows; i++) {
      List<int> row = [];
      for (int j = 0; j <= i; j++) {
        if (j == 0 || j == i) {
          row.add(1);
        } else {
          int val = triangle[i - 1][j - 1] + triangle[i - 1][j];
          row.add(val);
        }
      }
      triangle.add(row);
    }
    setState(() {
      pascalTriangle = triangle;
    });
  }
}
