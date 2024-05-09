part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetYearlyReportEvent extends ReportEvent {
  //
}

class GetMonthlyReportEvent extends ReportEvent {
  final int year;
  GetMonthlyReportEvent({required this.year});
}

class GetDailyReportEvent extends ReportEvent {
  final int year;
  final int month;
  GetDailyReportEvent({required this.year, required this.month});
}

class GetDateRangeReportEvent extends ReportEvent {
  final String startDate;
  final String endDate;
  GetDateRangeReportEvent({required this.startDate, required this.endDate});
}

class GetDetailReportEvent extends ReportEvent {
  final String date;
  GetDetailReportEvent({required this.date});
}

class GetDetailByCustomerReportEvent extends ReportEvent {
  final String id;
  GetDetailByCustomerReportEvent({required this.id});
}

class GetDetailByEmployeeReportEvent extends ReportEvent {
  final String id;
  GetDetailByEmployeeReportEvent({required this.id});
}
