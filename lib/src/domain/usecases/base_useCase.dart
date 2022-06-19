abstract class BaseUseCase<TResult, TParam> {
  Future<TResult> excute(TParam param);
}

class UseCaseResult {
  final Exception? exception;

  UseCaseResult({this.exception});

  bool get isSuccess => exception == null;
}
