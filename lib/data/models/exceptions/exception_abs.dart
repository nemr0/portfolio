abstract class ExceptionImpl implements Exception{
  final String? message;
  final String? error;
  final StackTrace? stackTrace;
  ExceptionImpl( { required this.message,required this.error, required this.stackTrace,});
}