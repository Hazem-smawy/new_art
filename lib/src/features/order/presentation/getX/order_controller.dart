// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/usecases/usecases.dart';
import 'package:newart/src/core/utils/dialogs.dart';
import 'package:newart/src/core/utils/usecase_helper.dart';
import 'package:newart/src/features/order/data/models/all_orders_model.dart';
import 'package:newart/src/features/order/data/models/new_order_mod_model.dart';
import 'package:newart/src/features/order/data/models/new_order_request_model.dart';
import 'package:newart/src/features/order/data/models/order_model.dart';
import 'package:newart/src/features/order/data/models/order_types_model.dart';
import 'package:newart/src/features/order/data/models/payment_order_model.dart';
import 'package:newart/src/features/order/data/models/transfer_model.dart';

import 'package:newart/src/features/order/domain/usecases/usecases.dart';
import 'package:newart/src/features/order/presentation/getX/file_picker_controller.dart';
import 'package:newart/src/features/order/presentation/getX/record_controller.dart';

import '../../../../core/types/status_types.dart';

class OrderController extends GetxController {
  FetchAllOrderTypesUseCase fetchAllOrderTypesUseCase;

  //usescase
  AddNewOrderUseCase addNewOrderUseCase;
  FetchAllOrderUseCase fetchAllOrderUseCase;
  GetOrderPaymentDetailsUseCase getOrderPaymentDetailsUseCase;
  PostTranserUserCase postTranserUserCase;
  AddNewOrderModUseCase addNewOrderModUseCase;

  Rx<Status> orderStatus = Status.initial.obs;
  Rx<Status> getPaymentStatus = Status.initial.obs;
  final orderFormKey = GlobalKey<FormState>();
  final paymentFormKey = GlobalKey<FormState>();
  final oldOrderModel = Rx<OrderModel?>(null);

  RecordController recordController = Get.find();
  FilePickerController filePickerController = Get.find();

  OrderController({
    required this.fetchAllOrderTypesUseCase,
    required this.addNewOrderUseCase,
    required this.fetchAllOrderUseCase,
    required this.getOrderPaymentDetailsUseCase,
    required this.postTranserUserCase,
    required this.addNewOrderModUseCase,
  });

  final orderTypes = Rx<OrderTypesResponse?>(null);
  final orderModel = Rx<OrderModel?>(null);
  final allOrders = Rx<AllOrdersModel?>(null);
  final selectedOrderType = Rx<OrderType?>(null);
  final selectedCurency = Rx<Currency?>(null);
  final selectedBank = Rx<BankAccount?>(null);
  final orderPaymentDetails = Rx<GetPaymentInfoModel?>(null);
  final orderPaymentResponseDetails = Rx<GetPaymentOrderInfoModel?>(null);
  final paymentImage = File('').obs;

  // controllers
  final nameController = TextEditingController();
  final artistNameController = TextEditingController();
  final noteController = TextEditingController();
  final linkController = TextEditingController();
  final novalController = TextEditingController();
  final unCompletedOrder = RxList<OrderModel>([]);
  final filteredOrders = RxList<OrderModel>([]);

  final sendrPhoneController = TextEditingController();
  final reciverPhoneController = TextEditingController();
  final reciverNameController = TextEditingController();
  final paymentNumberController = TextEditingController();
  final priceController = TextEditingController();

  final errorMessage = ''.obs;
  final getOrderMessage = ''.obs;
  final getPaymentErrorMessage = ''.obs;
  final createPaymentErrorMessage = ''.obs;

  //paymentcontroller

  final selectedCategory = 'الحالية'.obs;

  @override
  void onReady() {
    super.onReady();
    fetchOrderTypes();
    fetchAllOrders();
  }

  Future filterOrdersFunc(String key) async {
    if (key == 'المكتملة') {
      filteredOrders.value = allOrders.value!.orders
          .where((element) => element.orderStatus == 5)
          .toList();
    } else if (key == 'السابقة') {
      filteredOrders.value = allOrders.value!.orders
          .where((element) => element.orderStatus >= 5)
          .toList();
    }
    orderStatus.value =
        filteredOrders.isEmpty ? Status.initial : Status.success;
  }

  Future<void> fetchOrderTypes() async {
    await handleUsecase(
        usecase: fetchAllOrderTypesUseCase.call,
        target: orderTypes,
        errorMessageTarget: errorMessage);
    if (orderTypes.value?.orderTypes.isNotEmpty ?? false) {
      selectedOrderType.value = orderTypes.value?.orderTypes.first;
    }
  }

  Future<void> createNewPayment(int orderId) async {
    createPaymentErrorMessage.value = '';
    if (selectedBank.value == null) {
      CustomDialog.customSnackBar('قم بإختيار البنك', SnackPosition.TOP, true);
      return;
    }
    if (selectedBank.value == null) {
      CustomDialog.customSnackBar('قم بإختيار العملة', SnackPosition.TOP, true);
      return;
    }
    if (paymentImage.value.path == "") {
      CustomDialog.customSnackBar(
        'قم بأضافة صورة الحوالة ',
        SnackPosition.TOP,
        true,
      );
      return;
    }
    if (paymentFormKey.currentState!.validate()) {
      CustomDialog.loadingProgress();
      await handleUsecase(
        usecase: () => postTranserUserCase(
          Params<TransferModel>(
            TransferModel(
              orderId: orderId,
              currencyId: selectedCurency.value!.id,
              bankAccountId: selectedBank.value!.id,
              transferNumber: paymentNumberController.text,
              senderName: nameController.text,
              senderPhone: sendrPhoneController.text,
              recipientName: reciverNameController.text,
              recipientPhone: reciverPhoneController.text,
              amount: double.parse(priceController.text),
              date: DateTime.now().toString(),
              otherData: noteController.text,
              transferImage: paymentImage.value,
            ),
          ),
        ),
        target: orderPaymentResponseDetails,
        errorMessageTarget: createPaymentErrorMessage,
      );

      if (createPaymentErrorMessage.value.isEmpty) {
        await fetchAllOrders();
        Get.back();
        Get.back();
        CustomDialog.customSnackBar(
          'تمت العملية بنجاح',
          SnackPosition.TOP,
          false,
        );
      } else {
        Get.back();
        CustomDialog.customSnackBar(
          '${createPaymentErrorMessage.value}:فشل عملية الدفع',
          SnackPosition.TOP,
          true,
        );
      }
    } else {
      CustomDialog.customSnackBar(
        'قم بإدخال كل البيانات المطلوبة',
        SnackPosition.TOP,
        true,
      );
    }
  }

  Future<void> getPaymentDetails(int id) async {
    getPaymentStatus.value = Status.loading;
    getPaymentErrorMessage.value = '';
    await handleUsecase(
      usecase: () => getOrderPaymentDetailsUseCase(Params<int>(id)),
      target: orderPaymentDetails,
      errorMessageTarget: getPaymentErrorMessage,
    );
    if (getPaymentErrorMessage.value != ' ' &&
        orderPaymentDetails.value?.currencies != null) {
      getPaymentStatus.value =
          allOrders.value != null ? Status.success : Status.initial;
    } else {
      getPaymentStatus.value = Status.error;
    }
  }

  Future<void> fetchAllOrders() async {
    getOrderMessage.value = '';
    orderStatus.value = Status.loading;
    await handleUsecase(
      usecase: fetchAllOrderUseCase.call,
      target: allOrders,
      errorMessageTarget: getOrderMessage,
    );
    getUncompletedOrder();
    if (getOrderMessage.value.isEmpty) {
      orderStatus.value =
          allOrders.value != null ? Status.success : Status.initial;
    } else {
      orderStatus.value = Status.error;
    }
  }

  fillFromOldOrder(OrderModel updatedOrder) {
    oldOrderModel.value = updatedOrder;
    nameController.text = updatedOrder.nameOrder;
    artistNameController.text = updatedOrder.artistName;
    noteController.text = updatedOrder.comments;
    linkController.text = updatedOrder.workingLink;
    novalController.text = updatedOrder.orderData;
    selectedOrderType.value = orderTypes.value?.orderTypes.firstWhereOrNull(
      (element) => element.id == updatedOrder.orderTypeId,
    );
  }

  resetControllers() {
    oldOrderModel.value = null;
    noteController.clear();
    recordController.recordAudioFilePath.value = '';
    recordController.recordingPath.value = '';
    filePickerController.selectedFiles.clear();
  }

  Future<void> getUncompletedOrder() async {
    if (allOrders.value != null) {
      unCompletedOrder.value =
          allOrders.value!.orders.where((e) => e.orderStatus <= 4).toList();
    }
  }

  Future<void> addNewOrder(bool? isUpdate) async {
    if (orderFormKey.currentState?.validate() ?? false) {
      if (selectedOrderType.value == null) {
        CustomDialog.customSnackBar(
          'قم بإختيار نوع الطلب',
          SnackPosition.TOP,
          true,
        );

        return;
      }
      if (recordController.recordAudioFilePath.value == '' &&
          isUpdate == false) {
        CustomDialog.customSnackBar(
          'قم بأضافة المرفقات الصوتية',
          SnackPosition.TOP,
          true,
        );

        return;
      }
      File? audioClip;
      File? selectedFile;
      if (recordController.recordAudioFilePath.value != '') {
        audioClip = File(recordController.recordAudioFilePath.value);
      }
      if (filePickerController.selectedFiles.isNotEmpty &&
          filePickerController.selectedFiles.first.path != '') {
        selectedFile =
            File(filePickerController.selectedFiles.first.path ?? '');
      }

      CustomDialog.loadingProgress();
      final res = await addNewOrderUseCase(
        Params<NewOrderRequestModel>(
          NewOrderRequestModel(
            orderId: oldOrderModel.value?.id,
            workingLink: linkController.text,
            audioClip: audioClip,
            orderTypeId: selectedOrderType.value?.id.toString() ?? '0',
            nameOrder: nameController.text,
            artistName: artistNameController.text,
            comments: noteController.text,
            orderData: novalController.text,
            audioAttachment: selectedFile,
            isUpdate: isUpdate,
          ),
        ),
      );

      res.fold((f) {
        Get.back();
        CustomDialog.customSnackBar(
          'حدث خطأ ما',
          SnackPosition.TOP,
          true,
        );
      }, (r) async {
        if (isUpdate == null || isUpdate == false) {
          Get.back();
          CustomDialog.showDialog(
              title: 'تم بنجاح',
              description: r.message,
              color: Colors.green,
              icon: Icons.check_circle_outline,
              action: () {});
          await Future.delayed(Duration(milliseconds: 1000));
          if (Get.isDialogOpen ?? true) {
            Get.back();
          }
          Get.offNamed(Routes.TRACK_ORDER);
        } else {
          await fetchAllOrders();
          Get.back();
          CustomDialog.showDialog(
              title: 'تم بنجاح',
              description: r.message,
              color: Colors.green,
              icon: Icons.check_circle_outline,
              action: () {});
          await Future.delayed(Duration(milliseconds: 1200));
          if (Get.isDialogOpen ?? true) {
            Get.back();
          }
          Get.back(); // Pop the current page from the stack
        }

        // CustomDialog.customSnackBar(
        //   r.message,
        //   SnackPosition.TOP,
        //   false,
        // );
      });
    } else {
      CustomDialog.customSnackBar(
        'قم بإدخال كل البيانات المطلوبة',
        SnackPosition.TOP,
        true,
      );
    }
  }

  Future<void> addNewOrderMode(int? id) async {
    if (id == null) {
      CustomDialog.customSnackBar(
        'ليس هناك اي طلب',
        SnackPosition.TOP,
        true,
      );

      return;
    }
    if (orderFormKey.currentState?.validate() ?? false) {
      if (recordController.recordAudioFilePath.value == '') {
        CustomDialog.customSnackBar(
          'قم بأضافة المرفقات الصوتية',
          SnackPosition.TOP,
          true,
        );

        return;
      }
      File? audioClip;
      File? selectedFile;
      if (recordController.recordAudioFilePath.value != '') {
        audioClip = File(recordController.recordAudioFilePath.value);
      }
      if (filePickerController.selectedFiles.isNotEmpty &&
          filePickerController.selectedFiles.first.path != '') {
        selectedFile =
            File(filePickerController.selectedFiles.first.path ?? '');
      }

      CustomDialog.loadingProgress();
      final res = await addNewOrderModUseCase(
        Params<NewOrderModModel>(
          NewOrderModModel(
            orderId: id,
            description: noteController.text,
            audioClip: audioClip,
            audioAttachment: selectedFile,
          ),
        ),
      );

      res.fold((f) {
        Get.back();
        CustomDialog.customSnackBar(
          'حدث خطأ ما',
          SnackPosition.TOP,
          true,
        );
      }, (r) async {
        Get.back();

        await fetchAllOrders();
        CustomDialog.showDialog(
            title: 'تم بنجاح',
            description: r.message,
            color: Colors.green,
            icon: Icons.check_circle_outline,
            action: () {});
        await Future.delayed(Duration(milliseconds: 1000));
        if (Get.isDialogOpen ?? true) {
          Get.back();
        }
        Get.back(); // Pop the current page from the stack

        // CustomDialog.customSnackBar(
        //   r.message,
        //   SnackPosition.TOP,
        //   false,
        // );
      });
    } else {
      CustomDialog.customSnackBar(
        'قم بإدخال كل البيانات المطلوبة',
        SnackPosition.TOP,
        true,
      );
    }
  }
}
