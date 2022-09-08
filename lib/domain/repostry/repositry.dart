import 'package:dartz/dartz.dart';
import 'package:future_bride/data/network/failur.dart';
import 'package:future_bride/domain/models/models.dart';

import '../../data/network/loginrequest.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
