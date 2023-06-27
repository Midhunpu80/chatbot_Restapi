import 'dart:convert';
import 'package:http/http.dart' as http;

var respo;

const String apikey = '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';

Future<String> sendMessageToChatGpt(String message) async {
  var uri = Uri.parse("https://simple-chatgpt-api.p.rapidapi.com/ask");

  Map<String, dynamic> body = {'question': message.toString()};

  final response = await http.post(
    uri,
    headers: {
      'content-type': 'application/json',
      'X-RapidAPI-Key': 'ea3d193a8dmsh634a7991caff0ddp12b074jsn0999d3882f44',
      'X-RapidAPI-Host': 'simple-chatgpt-api.p.rapidapi.com'
    },
    body: json.encode(body),
  );

  print(response.body);

  Map<String, dynamic> parsedResponse = json.decode(response.body);

  String respo = parsedResponse['answer'];

  return respo;
}
