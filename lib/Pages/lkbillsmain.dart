import 'package:flutter/material.dart';

class Lkbillsmain extends StatefulWidget {
  const Lkbillsmain({super.key});

  @override
  State<Lkbillsmain> createState() => _LkbillsmainState();
}

class _LkbillsmainState extends State<Lkbillsmain> {

  String outText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(outText),
            ElevatedButton(onPressed: () {
              setState(() {
                outText = 'pressed';
              });
            }, child: Text('get orgs'))
          ],
        ),
      ),
    );
  }
}