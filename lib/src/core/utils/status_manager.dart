import 'package:get/get.dart';

enum Status { empty, loading, success, error }

class StatusController extends GetxController {
  // Reactive status variables for bills and items
  var billStatus = Status.empty.obs;
  var itemStatus = Status.empty.obs;

  // Methods to update statuses
  void setBillLoading() => billStatus.value = Status.loading;
  void setBillSuccess() => billStatus.value = Status.success;
  void setBillError() => billStatus.value = Status.error;

  void setItemLoading() => itemStatus.value = Status.loading;
  void setItemSuccess() => itemStatus.value = Status.success;
  void setItemError() => itemStatus.value = Status.error;
}
