import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lkbills/Helpers/elbaapi.dart';

class Lkbillsmain extends StatefulWidget {
  const Lkbillsmain({super.key});

  @override
  State<Lkbillsmain> createState() => _LkbillsmainState();
}

class _LkbillsmainState extends State<Lkbillsmain> {

  String outText = dotenv.env['elba'] ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(outText),
            ElevatedButton(onPressed: () async {
              var answer = await getElbaOrgs();
              setState(() {
                outText = answer ?? 'bad answer';
              });
            }, child: Text('get orgs'))
          ],
        ),
      ),
    );
  }
}