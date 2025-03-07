import 'package:equatable/equatable.dart';
import 'package:portfolio_shared/data/data_processors/date_processor.dart';

class ExperienceItem extends Equatable {
  final String from;
  final String to;
  final String company;
  final String jobTitle;

  const ExperienceItem(
      {required this.from,
      required this.to,
      required this.company,
      required this.jobTitle});

  factory ExperienceItem.fromMap(Map<String, dynamic> data) {
    return ExperienceItem(
        from: DateProcessor.resolveFromApi(data['from'] ?? ''),
        to: DateProcessor.resolveFromApi(data['to'] ?? ''),
        company: data['company'] ?? '',
        jobTitle: data['job_title'] ?? '');
  }

  @override
  String toString() {
    return 'ExperienceItem(from: $from, to: $to, company:$company, jobTitle: $jobTitle)';
  }

  Map<String, dynamic> toMap() =>
      {'from': from, 'to': to, 'company': company, 'jobTitle': jobTitle};

  @override
  List<Object?> get props => [from, to, company, jobTitle];
}
