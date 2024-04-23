import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:srs5/model/profile_user.dart';
part 'mobile_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class  MobileApi {
  factory MobileApi(Dio dio, {String baseUrl}) = _MobileApi;


  
  @GET("posts")
  Future<List<ProfileUser>> fetchPostsFromApi();

  fetchListData() {}
}

