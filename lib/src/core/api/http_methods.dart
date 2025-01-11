import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:new_art/src/core/error/error.dart';

import 'package:new_art/src/core/utils/check_internet.dart';

import '../helpers/get_token.dart';
import '../types/status_response.dart';

typedef ReturnData = Future<Map<String, dynamic>>;

class HttpMethons {
  Future<Map> postData(String linkurl, Map data) async {
    String myToken = getToken('0');

    Map<String, String> mapToken = {"Authorization": "Bearer $myToken"};
    print(myToken.toString());
    // log('message');

    if (await checkInternet()) {
      var response =
          await http.post(Uri.parse(linkurl), body: data, headers: mapToken);
      print(response.statusCode);

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

  Future<Either<StatusRequest, Map>> postOrderFile(
    String linkurl,
    Map<String, dynamic> data,
    File audioFile,
  ) async {
    String myToken = getToken('0');

    Map<String, String> mapToken = {"Authorization": "Bearer $myToken"};
    log(myToken.toString());

    if (await checkInternet()) {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));

      request.files
          .add(await http.MultipartFile.fromPath('audio_clip', audioFile.path));

      request.fields
          .addAll(data.map((key, value) => MapEntry(key, value.toString())));

      request.headers.addAll(mapToken);

      var response = await request.send();
      print(response.statusCode);

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

  Future<Either<StatusRequest, Map>> postModificationOrderOrderFile(
    String linkurl,
    Map<String, dynamic> data,
    File audioFile,
  ) async {
    String myToken = getToken('0');

    Map<String, String> mapToken = {"Authorization": "Bearer $myToken"};
    log(myToken.toString());

    if (await checkInternet()) {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));

      request.files.add(
          await http.MultipartFile.fromPath('audio_material', audioFile.path));

      request.fields
          .addAll(data.map((key, value) => MapEntry(key, value.toString())));

      request.headers.addAll(mapToken);

      var response = await request.send();
      print(response.statusCode);

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

  Future<Either<StatusRequest, Map>> postPaymentTransferImg(
    String linkurl,
    Map<String, dynamic> data,
    File audioFile,
  ) async {
    String myToken = getToken('0');

    Map<String, String> mapToken = {"Authorization": "Bearer $myToken"};
    log(myToken.toString());

    if (await checkInternet()) {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));
      log(linkurl.toString());

      request.files.add(
          await http.MultipartFile.fromPath('transfer_image', audioFile.path));

      request.fields
          .addAll(data.map((key, value) => MapEntry(key, value.toString())));

      request.headers.addAll(mapToken);

      var response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var responseJson = jsonDecode(responseBody);
        return Right(responseJson);
      } else if (response.statusCode == 401) {
        return const Left(StatusRequest.needLogin);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    if (await checkInternet()) {
      String myToken = getToken('0');

      Map<String, String> mapToken = {"Authorization": "Bearer $myToken"};

      log(myToken.toString());

      var response = await http.get(Uri.parse(linkurl), headers: mapToken);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        // print(responsebody);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
