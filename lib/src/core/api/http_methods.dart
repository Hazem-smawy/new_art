import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:newart/src/core/error/error.dart';

import 'package:newart/src/core/utils/check_internet.dart';
import 'package:newart/src/features/order/data/models/transfer_model.dart';

import '../../features/order/data/models/new_order_request_model.dart';
import '../helpers/get_token.dart';
import '../types/status_response.dart';

typedef ReturnData = Future<Map<String, dynamic>>;

class HttpMethons {
  String token = "37|wbreM78LqabCaE78bM4S0xkfGJW5TCyagspckPl4beea3bc7";

  Future<Map> postData(String linkurl, Map data) async {
    Map<String, String> mapToken = {"Authorization": "Bearer $token"};
    // log('message');

    if (await checkInternet()) {
      var response =
          await http.post(Uri.parse(linkurl), body: data, headers: mapToken);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        return responsebody;
      } else if (response.statusCode == 302) {
        getToken('1');

        throw NeedLoginException();
      } else {
        throw ServerException();
      }
    } else {
      throw OfflineException();
    }
  }

  // Future<Map<String, dynamic>> postOrderFile(
  //   String linkurl,
  //   NewOrderRequestModel newOrderRequest,
  // ) async {
  //   print(linkurl);
  //   // Replace 'token' with your actual token variable
  //   Map<String, String> headers = {"Authorization": "Bearer $token"};
  //   if (await checkInternet()) {
  //     // Create the multipart request
  //     final request = http.MultipartRequest('POST', Uri.parse(linkurl));

  //     // Add the audio file part using the path from the model
  //     if (newOrderRequest.audioClip?.path != null) {
  //       request.files.add(
  //         await http.MultipartFile.fromPath(
  //           'audio_clip', // key expected by the API
  //           newOrderRequest.audioClip!.path,
  //         ),
  //       );
  //     }
  //     if (newOrderRequest.audioAttachment?.path != null) {
  //       request.files.add(
  //         await http.MultipartFile.fromPath(
  //           'audio_attachment', // key expected by the API
  //           newOrderRequest.audioAttachment!.path,
  //         ),
  //       );
  //     }

  //     print("headers: $headers");

  //     // Convert the model to a map and remove the audio file key
  //     final requestData = newOrderRequest.toJson();
  //     print(requestData);
  //     requestData.remove('audio_clip');
  //     requestData.remove('audio_attachment');
  //     // Add remaining fields to the request (convert values to strings)
  //     request.fields.addAll(
  //       requestData.map((key, value) => MapEntry(key, value.toString())),
  //     );

  //     // Add the necessary headers
  //     request.headers.addAll(headers);

  //     // Send the request and wait for the response
  //     final response = await request.send();
  //     final responseBody = await response.stream.bytesToString();
  //     final orderResponse = jsonDecode(responseBody);

  //     print("orderResponse: $orderResponse");

  //     if (orderResponse['status'] == 'error') {
  //       throw ServerException(message: orderResponse['message']);
  //     }
  //     // Handle the response based on the status code
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return orderResponse;
  //     } else if (response.statusCode == 302) {
  //       throw NeedLoginException();
  //     } else {
  //       throw ServerException();
  //     }
  //   } else {
  //     throw OfflineException();
  //   }
  // }

  Future<Map<String, dynamic>> postOrderFile(
    String linkurl,
    NewOrderRequestModel newOrderRequest,
  ) async {
    // Replace 'token' with your actual token variable
    Map<String, String> headers = {"Authorization": "Bearer $token"};
    const int maxFileSize = 10 * 1024 * 1024; // 10 MB in bytes

    if (await checkInternet()) {
      // Create the multipart request
      final request = http.MultipartRequest('POST', Uri.parse(linkurl));

      // Add the audio file part using the path from the model with file size check
      if (newOrderRequest.audioClip?.path != null) {
        final audioClipFile = File(newOrderRequest.audioClip!.path);
        final audioClipSize = await audioClipFile.length();
        if (audioClipSize > maxFileSize) {
          throw ServerException(
              message:
                  "حجم ملف audio clip يتجاوز الحد المسموح به وهو 10 ميجابايت.");
        }
        request.files.add(
          await http.MultipartFile.fromPath(
            'audio_clip', // key expected by the API
            newOrderRequest.audioClip!.path,
          ),
        );
      }

      if (newOrderRequest.audioAttachment?.path != null) {
        final audioAttachmentFile = File(newOrderRequest.audioAttachment!.path);
        final audioAttachmentSize = await audioAttachmentFile.length();
        if (audioAttachmentSize > maxFileSize) {
          throw ServerException(
              message:
                  "حجم ملف audio clip يتجاوز الحد المسموح به وهو 10 ميجابايت.");
        }
        request.files.add(
          await http.MultipartFile.fromPath(
            'audio_attachment', // key expected by the API
            newOrderRequest.audioAttachment!.path,
          ),
        );
      }

      // Convert the model to a map and remove the audio file keys
      final requestData = newOrderRequest.toJson();
      requestData.remove('audio_clip');
      requestData.remove('audio_attachment');

      // Add remaining fields to the request (convert values to strings)
      request.fields.addAll(
        requestData.map((key, value) => MapEntry(key, value.toString())),
      );

      // Add the necessary headers
      request.headers.addAll(headers);

      // Send the request and wait for the response
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();
      final orderResponse = jsonDecode(responseBody);

      if (orderResponse['status'] == 'error') {
        throw ServerException(message: orderResponse['message']);
      }
      // Handle the response based on the status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        return orderResponse;
      } else if (response.statusCode == 302) {
        throw NeedLoginException();
      } else {
        throw ServerException();
      }
    } else {
      throw OfflineException();
    }
  }

  // Future<Map<String, dynamic>> postOrderFile(
  //   String linkurl,
  //   NewOrderRequestModel newOrderRequest,
  // ) async {
  //   try {
  //     // Replace 'token' with your actual token variable
  //     Map<String, String> headers = {"Authorization": "Bearer $token"};
  //     if (await checkInternet()) {
  //       // Create the multipart request
  //       final request = http.MultipartRequest('POST', Uri.parse(linkurl));

  //       // Add the audio file part using the path from the model
  //       request.files.add(
  //         await http.MultipartFile.fromPath(
  //           'audio_clip', // key expected by the API
  //           newOrderRequest.audioClip.path,
  //         ),
  //       );
  //       request.files.add(
  //         await http.MultipartFile.fromPath(
  //           'audio_attachment', // key expected by the API
  //           newOrderRequest.audioAttachment.path,
  //         ),
  //       );
  //       print("headers: $headers");

  //       // Convert the model to a map and remove the audio file key
  //       final requestData = newOrderRequest.toJson();
  //       requestData.remove('audio_clip');
  //       requestData.remove('audio_attachment');
  //       // Add remaining fields to the request (convert values to strings)
  //       request.fields.addAll(
  //         requestData.map((key, value) => MapEntry(key, value.toString())),
  //       );

  //       // Add the necessary headers
  //       request.headers.addAll(headers);

  //       // Send the request and wait for the response
  //       final response = await request.send();
  //       final responseBody = await response.stream.bytesToString();
  //       final orderResponse = jsonDecode(responseBody);

  //       print(orderResponse);

  //       if (orderResponse['status'] == 'error') {
  //         throw ServerException(message: orderResponse['message']);
  //       }
  //       // Handle the response based on the status code
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         return orderResponse;
  //       } else if (response.statusCode == 302) {
  //         throw NeedLoginException();
  //       } else {
  //         throw ServerException();
  //       }
  //     } else {
  //       throw OfflineException();
  //     }
  //   } catch (error, stackTrace) {
  //     print("Error in postOrderFile: $error");
  //     print("Stack trace: $stackTrace");
  //     rethrow; // Rethrow the error after logging it
  //   }
  // }

  Future<Either<StatusRequest, Map>> postModificationOrderOrderFile(
    String linkurl,
    Map<String, dynamic> data,
    File audioFile,
  ) async {
    Map<String, String> mapToken = {"Authorization": "Bearer $token"};

    if (await checkInternet()) {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));

      request.files.add(
          await http.MultipartFile.fromPath('audio_material', audioFile.path));

      request.fields
          .addAll(data.map((key, value) => MapEntry(key, value.toString())));

      request.headers.addAll(mapToken);

      var response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var responseJson = jsonDecode(responseBody);
        return Right(responseJson);
      } else if (response.statusCode == 302) {
        return const Left(StatusRequest.needLogin);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Map<String, dynamic>> postPaymentTransferImg(
    String linkurl,
    TransferModel data,
  ) async {
    String myToken = getToken('0');

    Map<String, String> mapToken = {"Authorization": "Bearer $token"};
    log(myToken.toString());

    if (await checkInternet()) {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));
      log(linkurl.toString());
      request.files.add(await http.MultipartFile.fromPath(
          'transfer_image', data.transferImage.path));
      final requestData = data.toJson();
      requestData.remove('transfer_image');
      requestData.remove('order_id');
      request.fields.addAll(
          requestData.map((key, value) => MapEntry(key, value.toString())));

      request.headers.addAll(mapToken);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = jsonDecode(responseBody);
        if (responseJson['status'] == 'error') {
          throw ServerException(message: responseJson['message']);
        }
        return responseJson;
      } else if (response.statusCode == 401) {
        throw NeedLoginException();
      } else {
        throw ServerException();
      }
    } else {
      throw OfflineException();
    }
  }

  Future<T> getData<T>(
      String linkurl, T Function(Map<String, dynamic>) fromJson) async {
    if (await checkInternet()) {
      String myToken = getToken('0');

      Map<String, String> mapToken = {"Authorization": "Bearer $token"};

      log(myToken.toString());

      var response = await http.get(Uri.parse(linkurl), headers: mapToken);

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          // Decode the response body to a Map
          Map<String, dynamic> responseBody = jsonDecode(response.body);
          // Use the fromJson function passed to map the response to the correct type
          return fromJson(responseBody);
        } catch (e) {
          throw ServerException(message: response.body);
        }
      } else {
        throw ServerException(message: response.body);
      }
    } else {
      throw OfflineException();
    }
  }
}
