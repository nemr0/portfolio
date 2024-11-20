import 'package:portfolio/presentation/helpers/date_processor.dart';

class ExperienceItem {
  final String from;
  final String to;
  final String company;
  final String jobTitle;

  ExperienceItem(
      {required this.from,
      required this.to,
      required this.company,
      required this.jobTitle});

  factory ExperienceItem.fromMap(Map<String, dynamic> data) {
    return ExperienceItem(
        from: DateProcessor.resolveFromApi(data['from'] ?? ''),
        to:  DateProcessor.resolveFromApi(data['to'] ?? ''),
        company: data['company'] ?? '',
        jobTitle: data['job_title'] ?? '');
  }
  @override
  String toString() {
    return 'ExperienceItem(from: $from, to: $to, company:$company, jobTitle: $jobTitle)';
  }
}
