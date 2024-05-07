import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sunhope_computer_software/data/purchase.dart';
import 'package:sunhope_computer_software/data/res_message.dart';
import '../../constants/const_api_routes.dart';
import '../data/category.dart';
import '../data/customer.dart';
import '../data/employee.dart';
import '../data/service.dart';

part 'api_repositories.g.dart';

@RestApi()
abstract class ApiRepositories {
  factory ApiRepositories(Dio dio, {String? baseUrl}) = _ApiRepositories;

  @GET(ConstApiRoutes.getAll)
  Future<dynamic> getAll();
  @GET("home")
  Future<dynamic> home();

  @GET(ConstApiRoutes.categories)
  Future<List<Category>> categories();

  @POST(ConstApiRoutes.category)
  Future<ResMessage> createCategory(@Body() Category category);

  @PUT(ConstApiRoutes.category)
  Future<ResMessage> updateCategory(@Body() Category category);

  @GET(ConstApiRoutes.services)
  Future<List<Service>> services();

  @GET("${ConstApiRoutes.services}/{id}")
  Future<List<Service>> servicesByCategoryId(@Path('id') String id);

  @POST(ConstApiRoutes.service)
  Future<ResMessage> createService(@Body() Service service);

  @PUT(ConstApiRoutes.service)
  Future<ResMessage> updateService(@Body() Service service);

  @GET(ConstApiRoutes.customers)
  Future<List<Customer>> customers();

  @GET(ConstApiRoutes.searchCustomers)
  Future<List<Customer>> searchCustomers(@Query("name") String name);

  @POST(ConstApiRoutes.customer)
  Future<ResMessage> createCustomer(@Body() Customer customer);

  @PUT(ConstApiRoutes.customer)
  Future<ResMessage> updateCustomer(@Body() Customer customer);

  @GET(ConstApiRoutes.employees)
  Future<List<Employee>> employees();

  // @GET(ConstApiRoutes.se)
  // Future<List<Customer>> searchCustomers(@Query("name") String name);

  @POST(ConstApiRoutes.employee)
  Future<ResMessage> createEmployee(@Body() Employee employee);

  @PUT(ConstApiRoutes.employee)
  Future<ResMessage> updateEmployee(@Body() Employee employee);

  @POST(ConstApiRoutes.purchase)
  Future<ResMessage> purchase(@Body() Purchase purchase);

  @GET(ConstApiRoutes.report)
  Future<List<Purchase>> report();

  @GET(ConstApiRoutes.yearly)
  Future<dynamic> yearly();

  @GET(ConstApiRoutes.monthly)
  Future<dynamic> monthly(@Query('year') int year);

  @GET(ConstApiRoutes.daily)
  Future<dynamic> daily(@Query('year') int year, @Query('month') int month);

  @GET(ConstApiRoutes.reportDetail)
  Future<List<Purchase>> reportDetail(@Query('year') int year,
      @Query('month') int month, @Query('day') int day);

// @GET("${ConstApiRoutes.items}/{id}")
  // Future<List<ProductModel>> productsByCategory(@Path('id') String id);
}
