import 'package:flutter/material.dart';
import 'api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiClient apiClient = ApiClient(baseUrl: 'https://0.0.0.0:8888/api/v1');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Client Example',
      home: FutureBuilder<Map<String, dynamic>>(
        future: apiClient.get('users'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users['data'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users['data'][index]['name']),
                  subtitle: Text(users['data'][index]['email']),
                );
              },
            );
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
