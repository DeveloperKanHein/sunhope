import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sunhope_computer_software/data/customer_create_req.dart';
import 'package:sunhope_computer_software/data/topup_req.dart';
import 'package:sunhope_computer_software/data/purchase.dart';
import 'package:sunhope_computer_software/data/res_message.dart';
import 'package:sunhope_computer_software/data/topup_history.dart';
import '../../constants/const_api_routes.dart';
import '../data/category.dart';
import '../data/customer.dart';
import '../data/daily.dart';
import '../data/employee.dart';
import '../data/gold_split_req.dart';
import '../data/login_req.dart';
import '../data/login_res.dart';
import '../data/monthly.dart';
import '../data/purchase_detail.dart';
import '../data/purchased.dart';
import '../data/service.dart';
import '../data/shop.dart';
import '../data/yearly.dart';

part 'api_repositories.g.dart';

@RestApi()
abstract class ApiRepositories {
  factory ApiRepositories(Dio dio, {String? baseUrl}) = _ApiRepositories;

  @POST(ConstApiRoutes.login)
  Future<LoginRes> login(@Body() LoginReq loginReq);

  @GET(ConstApiRoutes.shops)
  Future<List<Shop>> shops();

  @POST(ConstApiRoutes.shop)
  Future<LoginRes> createShop(@Body() Shop shop);

  @PUT(ConstApiRoutes.shop)
  Future<LoginRes> updateShop(@Body() Shop shop);

  @GET(ConstApiRoutes.home)
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

  @GET(ConstApiRoutes.searchServices)
  Future<List<Service>> searchServices(@Query('name') String name);

  @POST(ConstApiRoutes.service)
  Future<ResMessage> createService(@Body() Service service);

  @PUT(ConstApiRoutes.service)
  Future<ResMessage> updateService(@Body() Service service);

  @GET(ConstApiRoutes.customers)
  Future<List<Customer>> customers();

  @GET(ConstApiRoutes.searchCustomers)
  Future<List<Customer>> searchCustomers(@Query("name") String name);

  @POST(ConstApiRoutes.customer)
  Future<ResMessage> createCustomer(@Body() CustomerCreateReq customer);

  @PUT(ConstApiRoutes.customer)
  Future<ResMessage> updateCustomer(@Body() Customer customer);

  @POST(ConstApiRoutes.topup)
  Future<ResMessage> topup(@Body() TopupReq topup);

  @GET(ConstApiRoutes.employees)
  Future<List<Employee>> employees();

  @GET(ConstApiRoutes.searchEmployee)
  Future<List<Employee>> searchEmployee(@Query("name") String name);

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
  Future<List<Yearly>> yearly();

  @GET(ConstApiRoutes.monthly)
  Future<List<Monthly>> monthly(@Query('year') int year);

  @GET(ConstApiRoutes.daily)
  Future<List<Daily>> daily(@Query('year') int year, @Query('month') int month);

  @GET(ConstApiRoutes.dateRangeReport)
  Future<List<Daily>> dateRangeReport(
      @Query('startDate') String startDate, @Query('endDate') String endDate);

  @GET(ConstApiRoutes.reportDetail)
  Future<List<Purchased>> reportDetail(@Query('date') String date);

  @GET("${ConstApiRoutes.purchaseByCustomerId}/{id}")
  Future<List<Purchased>> reportByCustomer(@Path('id') String id);

  @GET("${ConstApiRoutes.purchaseByEmployeeId}/{id}")
  Future<List<Purchased>> reportByEmployee(@Path('id') String id);

  @GET("${ConstApiRoutes.purchaseById}/{id}")
  Future<PurchaseDetail> purchaseById(@Path('id') String id);

  @GET(ConstApiRoutes.topupHistories)
  Future<List<TopupHistory>> topupHistories();

  @GET(ConstApiRoutes.customerTopupHistories)
  Future<List<TopupHistory>> customerTopupHistories(
      @Query('customer') String customer);

  @GET(ConstApiRoutes.customerTopupHistories)
  Future<List<TopupHistory>> split(@Body() List<GoldSplitReq> reqBody);
}
