import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        title: Text(
          'XDJcc',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            print('aaaaaa');
            Navigator.of(context).pushNamed('/splash');
          },
          child: Text('I am XDJcc'),
        ),
      ),
    );
  }
}
