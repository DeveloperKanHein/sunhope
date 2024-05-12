part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReportInitializing extends ReportState {
  //
}

class YearlyReportLoading extends ReportState {
  //
}

class YearlyReportLoaded extends ReportState {
  final List<Yearly> yearlyReports;
  YearlyReportLoaded({required this.yearlyReports});
}

class MonthlyReportLoading extends ReportState {
  //
}

class MonthlyReportLoaded extends ReportState {
  final List<Monthly> monthlyReports;
  MonthlyReportLoaded({required this.monthlyReports});
}

class DailyReportLoading extends ReportState {
  //
}

class DailyReportLoaded extends ReportState {
  final List<Daily> dailyReports;
  DailyReportLoaded({required this.dailyReports});
}

class DetailReportLoading extends ReportState {
  //
}

class DetailReportLoaded extends ReportState {
  final List<Purchased> data;
  DetailReportLoaded({required this.data});
}

class DateRangeReportLoading extends ReportState {
  //
}

class DateRangeReportLoaded extends ReportState {
  final List<Daily> data;
  DateRangeReportLoaded({required this.data});
}

class ReportEmpty extends ReportState {
  //
}

class ReportError extends ReportState {
  //
}
