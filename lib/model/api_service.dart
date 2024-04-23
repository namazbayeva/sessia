import 'package:dio/dio.dart'; 
 
class ApiService { 
  final Dio _dio = Dio(); 
 
  Future<List<Map<String, dynamic>>> fetchPosts() async { 
    try { 
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts'); 
      if (response.statusCode == 200) { 
        List<dynamic> data = response.data; 
        return List<Map<String, dynamic>>.from(data); 
      } else { 
        throw Exception('Failed to fetch posts'); 
      } 
    } catch (e) { 
      throw Exception('Failed to fetch posts: $e'); 
    } 
  } 
 
  Future<Map<String, dynamic>> fetchPostById(int id) async { 
    try { 
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts'); 
      if (response.statusCode == 200) { 
        return Map<String, dynamic>.from(response.data); 
      } else { 
        throw Exception('Failed to fetch post with id $id'); 
      } 
    } catch (e) { 
      throw Exception('Failed to fetch post with id $id: $e'); 
    } 
  } 
}