import 'package:dartz/dartz.dart';
import 'package:future_bride/data/network/failur.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
