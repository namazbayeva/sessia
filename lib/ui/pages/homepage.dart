import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  Map<String, dynamic> _post = {};

  @override
  void initState() {
    super.initState();
    _fetchPost(); 
  }

  Future<void> _fetchPost() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts/2');
      if (response.statusCode == 200) {
        setState(() {
          _post = response.data;
        });
      } else {
        throw Exception('Failed to fetch post');
      }
    } catch (e) {
      print('Error fetching post: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${_post['id'] ?? ''}',
              style: TextStyle(
                fontSize: 16,
                
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'User ID: ${_post['userId'] ?? ''}',
              style: TextStyle(
                fontSize: 16,
                
              ),
            ),
            SizedBox(height: 8.0),
            
            Text(
              'Title: ${_post['title'] ?? ''}',
              style: TextStyle(
                fontSize: 16,
                
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Body: ${_post['body'] ?? ''}',
              style: TextStyle(
                fontSize: 16,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
