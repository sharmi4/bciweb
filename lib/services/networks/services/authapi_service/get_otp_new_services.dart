import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  LoginService._();

  static login(String mobile) async {
    // print('email $email');
    try {
      final queryParameters = {'mobile': mobile};
      final uri = Uri.parse('https://bci.batechnology.in/api/category');
      final response =
          await http.post(uri, body: json.encode(queryParameters), headers: {
        "Content-Type": "application/json",
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        data['res'] = 'success';
        // CommonService.userDetails = data;
        return data;
      } else {
        var data = jsonDecode(response.body.toString());
        data['res'] = 'error';

        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
