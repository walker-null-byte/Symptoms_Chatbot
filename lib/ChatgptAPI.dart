import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

// Function to send user message and get a response from the ChatGPT API
Future<List<List>> sendMessage(String message) async {

  var url = Uri.parse('https://symptom-checker4.p.rapidapi.com/analyze');
  var headers = {
    "content-type": "application/json",
    "X-RapidAPI-Key": "ADD-YOUR-KEY",
    "X-RapidAPI-Host": "symptom-checker4.p.rapidapi.com"
  };

  var body = json.encode({'symptoms': message});

  var response = await http.post(url, body: body, headers: headers);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print("DATA IS"+data['potentialCauses'][0]);
    var potentialCauses = data['potentialCauses'] as List;
    var followupQuestions = data['followupQuestions'] as List;
    var reply = [potentialCauses, followupQuestions];
    return reply;
  } else {
    throw Exception('Failed to send message to RapidAPI');
  }

}
