import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XDJ',),
      ),
      body: Center(
        child: InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamed('/splash', arguments: {'name': 'XDJcc'});
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('I am XDJcc'),
              ],
            )),
      ),
    );
  }
}
