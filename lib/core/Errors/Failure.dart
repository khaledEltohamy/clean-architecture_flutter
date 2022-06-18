import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FaluireService extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FaluireOffline extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FaluireEmptyCache extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
