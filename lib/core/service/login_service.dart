import 'package:next_test/core/network/http_client.dart';
import 'package:next_test/core/repositories/create_response.dart';
import 'package:next_test/core/service/login_endpoint.dart';

abstract class LoginService {
  Future<CreateResponse> postSubmit(String name, String hobby);
}

class LoginServiceImpl implements LoginService {
  final HttpClient httpClient;
  final LoginEndpoint loginEndpoint;

  LoginServiceImpl({
    required this.httpClient,
    required this.loginEndpoint,
  });

  factory LoginServiceImpl.create() {
    return LoginServiceImpl(
      httpClient: AppHttpClient.create(),
      loginEndpoint: LoginEndpoint(),
    );
  }

  @override
  Future<CreateResponse> postSubmit(String name, String hobby) async {
    final url = loginEndpoint.postSubmit();
    final response = await httpClient.post(
      url,
      {},
      {
        "name": name,
        "job": hobby,
      },
    );
    return CreateResponse.fromJson(response);
  }
}
