

import 'package:youthfoundationofindia/network/api_client.dart';

class CreateNewUser{

void loginUser() async {
  ApiClient apiClient = ApiClient();

  Map<String, dynamic> requestBody = {
    "userId": "Admin123",
    "password": "admin123@"
  };

  ApiResponse response = await apiClient.post("/api/v1/login", requestBody);

  if (response.isSuccess) {
    final Map<String, dynamic> data = response.data;
    
    if (data.containsKey('data') && data['data']['token'] != null) {
      String token = data['data']['token'];
      await apiClient.saveToken(token);
      print("Login Successful. Token stored!");
    } else {
      print("Token not found in response.");
    }
  } else {
    print("Login Failed: ${response.errorMessage}");
  }
}


}