class ResultModel<T> {
  bool success;
  T? result;
  String? errorMsg;
  ResultModel(this.success, this.result, this.errorMsg);

  static ResultModel<T> error<T>(String errorMsg) {
    return ResultModel<T>(false, null, errorMsg);
  }
  
  static ResultModel<T> ok<T>(T data) {
    return ResultModel<T>(true, data, '');
  }
}