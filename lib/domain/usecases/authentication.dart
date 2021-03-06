import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class Authentication {
  Future<AccountEntity> auth({
    @required AuthenticationParams params
  });
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({
    this.email,
    this.password
  });
}