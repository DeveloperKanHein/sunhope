// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';
// import '../../constants/const_api_routes.dart';
//
//
// part 'auth_api_repository.g.dart';
//
// @RestApi(baseUrl: ConstApiRoutes.stagingAuthURL)
// abstract class AuthApiRepository {
//   factory AuthApiRepository(Dio dio, {String? baseUrl}) = _AuthApiRepository;
//
//   @POST(ConstApiRoutes.register)
//   Future<AuthRes> register(@Body() User user);
//
//   @POST(ConstApiRoutes.login)
//   Future<AuthRes> login(@Body() User user);
// }
