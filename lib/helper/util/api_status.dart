import 'package:meta/meta.dart';

@immutable
abstract class ApiRequestStatus {
  const ApiRequestStatus();
}

class InitialApiRequestStatus extends ApiRequestStatus {
  const InitialApiRequestStatus();
}

class ApiRequestStatusLoading extends ApiRequestStatus {}

class ApiRequestStatusSuccess extends ApiRequestStatus {
  final dynamic data;
  final List<dynamic>? dataList;

  const ApiRequestStatusSuccess({this.data, this.dataList});
}

class ApiRequestStatusFailure extends ApiRequestStatus {
  final dynamic errorCode;
  final String errorMessage;

  const ApiRequestStatusFailure(this.errorCode, this.errorMessage);
}
