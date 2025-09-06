import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lkbills/Helpers/elbaapi.dart';
import 'package:lkbills/globals.dart';

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
                outText = answer.toString();
              });
              if (answer is Map && answer.containsKey('organizations')) {
                myOrgId = (answer['organizations'] as List).first['id'];
                setState(() {
                  outText = myOrgId;
                });
                answer = await getElbaContractors();
                setState(() {
                  outText = answer.toString();
                });
              }
            }, child: Text('get orgs'))
          ],
        ),
      ),
    );
  }
}