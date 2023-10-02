import 'package:mvvm_demo/data/response/status.dart';

class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse(this.status, this.message, this.data); // Constructor

  // Loading
  ApiResponse.loading() : status = Status.LOADING;

  // COMPLETED

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  // ERROR

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message\n Data $data";
  }
}
