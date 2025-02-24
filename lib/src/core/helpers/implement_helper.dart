import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/error.dart';

/// A helper function that handles the response and errors
Future<Either<Failure, T>> handleApiResponse<T>(
    Future<T> Function() apiCall) async {
  try {
    // Call the API method (e.g., fetch order types, etc.)
    final response = await apiCall();
    return Right(response); // If successful, return the result wrapped in Right
  } catch (e) {
    // Handle different errors and return the appropriate Failure
    if (e is OfflineException) {
      return Left(OfflineFailure()); // Return failure for offline error
    } else if (e is ServerException) {
      return Left(
          ServerFailure(message: e.message)); // Return failure for server error
    } else {
      return Left(
          ServerFailure(message: "Unknown error: $e")); // Handle unknown errors
    }
  }
}
