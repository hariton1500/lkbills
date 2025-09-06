import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:lkbills/globals.dart';
getElbaOrgs() async {
  try {
    var response = await http.get(Uri.parse('https://elba-api.kontur.ru/v1/organizations?'), headers: {'X-Kontur-ApiKey': dotenv.env['elba'] ?? ''});
    if (response.statusCode == 200) {
      var body = response.body;
      var decoded = jsonDecode(body);
      return decoded;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return e.toString();
  }
  
}

getElbaContractors() async {
  try {
    var response = await http.post(Uri.parse('https://elba-api.kontur.ru/v1/organizations/$myOrgId/contarctors/search'), headers: {'X-Kontur-ApiKey': dotenv.env['elba'] ?? ''});
    if (response.statusCode == 200) {
      var body = response.body;
      var decoded = jsonDecode(body);
      return decoded;
    } else {
      return null;
    }
  } catch (e) {
    print(e);
    return e.toString();
  }
  
}