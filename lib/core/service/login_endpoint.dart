import 'package:next_test/core/network/url_builder.dart';

class LoginEndpoint {
  LoginEndpoint();

  Uri postSubmit() {
    return createUrl(
      path: "api/users",
    );
  }
}
