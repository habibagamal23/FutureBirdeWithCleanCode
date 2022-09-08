import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../response/respon.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: "https://habibagamal.mocklab.io")
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/Customer/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
