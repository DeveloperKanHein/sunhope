import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api_repository/api_repo_singleton.dart';
import '../../data/daily.dart';
import '../../data/monthly.dart';
import '../../data/purchase.dart';
import '../../data/purchased.dart';
import '../../data/yearly.dart';

part 'report_event.dart';
part 'report_state.dart';

class GetYearlyReportBloc extends Bloc<GetYearlyReportEvent, ReportState> {
  GetYearlyReportBloc() : super(ReportInitializing()) {
    on<GetYearlyReportEvent>((event, emit) async {
      try {
        emit(YearlyReportLoading());
        final List<Yearly> reports = await ApiRepoSingleton.instance.yearly();
        if (reports.isNotEmpty) {
          emit(YearlyReportLoaded(yearlyReports: reports));
        } else {
          emit(ReportEmpty());
        }
      } catch (e) {
        emit(ReportError());
      }
    });
  }
}

class GetMonthlyReportBloc extends Bloc<GetMonthlyReportEvent, ReportState> {
  GetMonthlyReportBloc() : super(ReportInitializing()) {
    on<GetMonthlyReportEvent>((event, emit) async {
      try {
        emit(MonthlyReportLoading());
        final List<Monthly> reports =
            await ApiRepoSingleton.instance.monthly(event.year);
        if (reports.isNotEmpty) {
          emit(MonthlyReportLoaded(monthlyReports: reports));
        } else {
          emit(ReportEmpty());
        }
      } catch (e) {
        emit(ReportError());
      }
    });
  }
}

class GetDailyReportBloc extends Bloc<GetDailyReportEvent, ReportState> {
  GetDailyReportBloc() : super(ReportInitializing()) {
    on<GetDailyReportEvent>((event, emit) async {
      try {
        emit(DailyReportLoading());
        final List<Daily> reports =
            await ApiRepoSingleton.instance.daily(event.year, event.month);
        if (reports.isNotEmpty) {
          emit(DailyReportLoaded(dailyReports: reports));
        } else {
          emit(ReportEmpty());
        }
      } catch (e) {
        emit(ReportError());
      }
    });
  }
}

class GetDateRangeReportBloc
    extends Bloc<GetDateRangeReportEvent, ReportState> {
  GetDateRangeReportBloc() : super(ReportInitializing()) {
    on<GetDateRangeReportEvent>((event, emit) async {
      try {
        emit(DateRangeReportLoading());
        final List<Daily> reports = await ApiRepoSingleton.instance
            .dateRangeReport(event.startDate, event.endDate);
        if (reports.isNotEmpty) {
          emit(DateRangeReportLoaded(data: reports));
        } else {
          emit(ReportEmpty());
        }
      } catch (e) {
        emit(ReportError());
      }
    });
  }
}

class GetDetailReportBloc extends Bloc<ReportEvent, ReportState> {
  GetDetailReportBloc() : super(ReportInitializing()) {
    on<ReportEvent>((event, emit) async {
      if (event is GetDetailReportEvent) {
        try {
          emit(DetailReportLoading());
          List<Purchased> reports =
              await ApiRepoSingleton.instance.reportDetail(event.date);
          if (reports.isNotEmpty) {
            emit(DetailReportLoaded(data: reports));
          } else {
            emit(ReportEmpty());
          }
        } catch (e) {
          emit(ReportError());
        }
      } else if (event is GetDetailByCustomerReportEvent) {
        try {
          emit(DetailReportLoading());
          List<Purchased> reports =
              await ApiRepoSingleton.instance.reportByCustomer(event.id);
          if (reports.isNotEmpty) {
            emit(DetailReportLoaded(data: reports));
          } else {
            emit(ReportEmpty());
          }
        } catch (e) {
          emit(ReportError());
        }
      } else if (event is GetDetailByEmployeeReportEvent) {
        try {
          emit(DetailReportLoading());
          List<Purchased> reports =
              await ApiRepoSingleton.instance.reportByEmployee(event.id);
          if (reports.isNotEmpty) {
            emit(DetailReportLoaded(data: reports));
          } else {
            emit(ReportEmpty());
          }
        } catch (e) {
          emit(ReportError());
        }
      }
    });
  }
}
//
// class GetDetailByCustomerReportBloc extends Bloc<GetDetailByEmployeeReportEvent, ReportState> {
//   GetDetailByCustomerReportBloc() : super(ReportInitializing()) {
//     on<GetDetailByEmployeeReportEvent>((event, emit) async {
//       try {
//         emit(DetailReportLoading());
//         final List<Purchase> reports =
//         await ApiRepoSingleton.instance.reportByCustomer(event.id);
//         if (reports.isNotEmpty) {
//           emit(DetailReportLoaded(data: reports));
//         } else {
//           emit(ReportEmpty());
//         }
//       } catch (e) {
//         emit(ReportError());
//       }
//     });
//   }
// }
