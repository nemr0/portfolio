abstract class ExceptionImpl implements Exception{
  final String? message;
  final String? error;
  final StackTrace? stackTrace;
  ExceptionImpl( { required this.message,required this.error, required this.stackTrace,});
  @override
  String toString() {
    return 'message: $message,\nerror: $error,\nstackTrace: $stackTrace';
  }
}