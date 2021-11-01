import 'dart:convert';

import 'package:notion_api/base_client.dart';
import 'package:notion_api/notion.dart';
import 'package:http/http.dart' as http;
class TextToSpeech{
  //NotionClient notion = NotionClient(token: 'secret_gQx4GUgqGRjKcfOIbl0C2M92TeGBuxg4OQhfmlCV5v6');
  getData()async{
    String token = 'secret_gQx4GUgqGRjKcfOIbl0C2M92TeGBuxg4OQhfmlCV5v6';
    var headers = {
      "Authorization":"Bearer $token",
      "Notion-Version" : "2021-08-16",
    };
    Uri uri = Uri.parse("https://api.notion.com/v1/pages/02e919b536a24c2db7856180378cd450");
    var request = await http.get(uri,headers: headers);
    print(request.statusCode);
    if(request.statusCode==200)
    {
      print(request.body);
      var jsonData = jsonDecode(request.body);
    }
  }
}