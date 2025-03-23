import 'package:portfolio/data/models/exceptions/exception_abs.dart';

class NetworkException extends ExceptionImpl{
  NetworkException( {required this.endpoint, super.stackTrace,super.error,super.message='No Internet Connection, Try Again Later!'});
  final String endpoint;

}