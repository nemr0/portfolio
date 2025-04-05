import 'package:portfolio/data/models/exceptions/exception_abs.dart';

class ParseException extends ExceptionImpl{
  ParseException({
    required super.stackTrace,
    super.error,
    super.message = 'Something went wrong,Please try Again Later!',
  });
}
