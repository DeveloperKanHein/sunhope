import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/topup/topup_bloc.dart';
import 'package:sunhope_computer_software/data/topup_req.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';

import '../../core/show_price.dart';
import '../../data/customer.dart';
import '../../widgets/state_widgets.dart';

class TopupHistoryScreen extends StatefulWidget {
  const TopupHistoryScreen({super.key});

  @override
  State<TopupHistoryScreen> createState() => _TopupHistoryScreenState();
}

class _TopupHistoryScreenState extends State<TopupHistoryScreen> {
  final cash = TextEditingController();
  final kpay = TextEditingController();
  final _bloc = GetTopupHistoryBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetTopupHistoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top-Up"),
      ),
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<GetTopupHistoryBloc, TopupState>(
          listener: (context, state) {
            //
          },
          child: BlocBuilder<GetTopupHistoryBloc, TopupState>(
            builder: (context, state) {
              if (state is TopupHistoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TopupHistoryEmpty) {
                return const Center(child: Text("Empty Data!"));
              } else if (state is TopupHistoryError) {
                return const Center(child: Text("Network Error :("));
              } else if (state is TopupHistoryLoaded) {
                final histories = state.histories;
                return ListView(
                  children: [
                    DataTable(
                      columns: const [
                        DataColumn(
                            label: Text('Date',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Shop',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Customer Name',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Cash',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Kpay',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                      ],
                      rows: [
                        for (int i = 0; i < histories.length; i++)
                          DataRow(cells: [
                            DataCell(Text(
                                state.histories[i].createdAt!.split("T")[0])),
                            DataCell(Text(state.histories[i].shop == null
                                ? ""
                                : state.histories[i].shop!.name!)),
                            DataCell(Text(state.histories[i].customer == null
                                ? ""
                                : state.histories[i].customer!.name!)),
                            DataCell(
                                Text(showPrice(state.histories[i].cash ?? 0))),
                            DataCell(
                                Text(showPrice(state.histories[i].kpay ?? 0))),
                          ]),
                      ],
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
