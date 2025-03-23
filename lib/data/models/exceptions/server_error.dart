import 'package:portfolio/data/models/exceptions/exception_abs.dart';

class ServerException extends ExceptionImpl{
  ServerException( {required this.endpoint,required super.stackTrace,super.message = 'Something went wrong,Please try Again Later!',super.error});
  final String endpoint;
}