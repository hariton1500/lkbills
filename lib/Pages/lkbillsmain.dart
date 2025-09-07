import 'package:flutter/material.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lkbills/Helpers/elbaapi.dart';
import 'package:lkbills/globals.dart';

class Lkbillsmain extends StatefulWidget {
  const Lkbillsmain({super.key});

  @override
  State<Lkbillsmain> createState() => _LkbillsmainState();
}

class _LkbillsmainState extends State<Lkbillsmain> {

  String outText = '';// = dotenv.env['elba'] ?? '';

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
                outText += '\n$answer';
              });
              //get our organization ID
              if (answer is Map && answer.containsKey('organizations')) {
                myOrgId = (answer['organizations'] as List).first['id'];
                setState(() {
                  outText += '\n$myOrgId';
                });
                var answer2 = await getElbaContractors();
                setState(() {
                  outText += '\n${answer2.toString()}';
                });
              }
            }, child: Text('get orgs'))
          ],
        ),
      ),
    );
  }
}