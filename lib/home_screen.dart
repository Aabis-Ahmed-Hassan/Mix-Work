import 'package:flutter/material.dart';
import 'package:mix_work/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mix Work'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        MyRow(title1: 'Title1', color1: Colors.blue, title2: 'Title2', color2: Colors.red, navigatoTo1: MyApp(), navigatoTo2: MyApp())

        ],
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  var title1, color1, title2, color2, navigatoTo1, navigatoTo2;

  MyRow(
      {super.key,
      required this.title1,
      required this.color1,
      required this.title2,
      required this.color2,
      required this.navigatoTo1,
      required this.navigatoTo2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => navigatoTo1));
            },
            child: Container(
              height: 50,
              color: color1,
              child: Center(
                child: Text(title1.toString()),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => navigatoTo2));
            },
            child: Container(
              height: 50,
              color: color2,
              child: Center(
                child: Text(title2.toString()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
