import 'package:dartz/dartz.dart';
import 'package:data/data.dart';

abstract class UseCase<Input, Output> {
  Output execute(Input input);
}

abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input input);
}

abstract class StreamUseCase<Input, Output> {
  Stream<Output> execute(Input input);
}

abstract class FailureUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
