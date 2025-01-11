import 'dart:developer';
import 'dart:io';

import 'package:new_art/src/core/api/api.dart';
import 'package:new_art/src/core/api/http_methods.dart';

class HomeRemoteSource {
  HttpMethons crud;
  HomeRemoteSource(this.crud);
  getHomeData() async {
    var response = await crud.getData(AppLink.home);
    return response.fold((l) => l, (r) => r);
  }

  getCategorie() async {
    var response = await crud.getData(AppLink.getCatiegory);
    return response.fold((l) => l, (r) => r);
  }

  postOrder(
    String orderTypeId,
    String nameOrder,
    String artistName,
    String orderData,
    String workingLink,
    String comments,
    File audofile,
  ) async {
    var response = await crud.postOrderFile(
        AppLink.storeorder,
        {
          "order_type_id": orderTypeId,
          "name_order": nameOrder,
          "artist_name": artistName,
          "order_data": orderData,
          "working_link": workingLink,
          "comments": comments,
        },
        audofile);
    return response.fold((l) => l, (r) => r);
  }
}

class ActivityData {
  HttpMethons crud;
  ActivityData(this.crud);
  getBankData() async {
    var response = await crud.getData(AppLink.getOurBank);
    return response.fold((l) => l, (r) => r);
  }

  getPayment() async {
    var response = await crud.getData(AppLink.getPaymentsAll);
    return response.fold((l) => l, (r) => r);
  }

  getBusinessData() async {
    var response = await crud.getData(AppLink.getOurBusiness);
    return response.fold((l) => l, (r) => r);
  }

  getPackagesData() async {
    var response = await crud.getData(AppLink.getPackages);
    return response.fold((l) => l, (r) => r);
  }

  getPaymentsData() async {
    var response = await crud.getData(AppLink.getPayments);
    return response.fold((l) => l, (r) => r);
  }

  getOrdersIndexData() async {
    var response = await crud.getData(AppLink.getOrderIndex);
    return response.fold((l) => l, (r) => r);
  }

  getModificationOrderData() async {
    var response = await crud.getData(AppLink.getModificationOrder);
    return response.fold((l) => l, (r) => r);
  }

  getFaqsData() async {
    var response = await crud.getData(AppLink.getFaqs);
    return response.fold((l) => l, (r) => r);
  }

  getAboutData() async {
    var response = await crud.getData(AppLink.getAbout);
    return response.fold((l) => l, (r) => r);
  }

  getExclusiveData() async {
    var response = await crud.getData(AppLink.getExclusive);
    return response.fold((l) => l, (r) => r);
  }

  postModificationOrder(
    String orderId,
    String description,
    File audofile,
  ) async {
    var response = await crud.postModificationOrderOrderFile(
        '${AppLink.postModificationOrder}$orderId',
        {
          "description": description,
        },
        audofile);
    return response.fold((l) => l, (r) => r);
  }

  postPaymentTransfer(
    String orderId,
    String currencyId,
    String bankBaccountId,
    String transferNumber,
    String senderName,
    String senderPhone,
    String recipientName,
    String recipientPhone,
    String amount,
    String date,
    String otherData,
    File audofile,
  ) async {
    log(date.toString());
    var response = await crud.postPaymentTransferImg(
        '${AppLink.postPaymentTransfer}$orderId',
        {
          'currency_id': currencyId,
          'bank_account_id': bankBaccountId,
          'transfer_number': transferNumber,
          'sender_name': senderName,
          'sender_phone': senderPhone,
          'recipient_name': recipientName,
          'recipient_phone': recipientPhone,
          'amount': amount,
          'date': date,
          'other_data': otherData
        },
        audofile);
    return response.fold((l) => l, (r) => r);
  }
}
