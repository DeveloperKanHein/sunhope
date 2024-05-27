import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';

import '../../../blocs/employee/employee_bloc.dart';
import '../../../widgets/state_widgets.dart';

class SearchEmployeeWidget extends StatefulWidget {
  const SearchEmployeeWidget({super.key});

  @override
  State<SearchEmployeeWidget> createState() => _SearchEmployeeWidgetState();
}

class _SearchEmployeeWidgetState extends State<SearchEmployeeWidget> {
  final _name = TextEditingController();
  final _bloc = GetEmployeeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetEmployeeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Choose Employee"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              controller: _name,
              label: "Search Employee",
              onTyping: (_) {},
              suffixWidget: InkWell(
                  onTap: () {
                    _bloc.add(SearchEmployeeEvent(name: _name.text));
                  },
                  child: const Icon(Icons.search)),
            ),
            const SizedBox(height: 15),
            BlocProvider(
              create: (_) => _bloc,
              child: BlocListener<GetEmployeeBloc, EmployeeState>(
                listener: (context, state) {},
                child: BlocBuilder<GetEmployeeBloc, EmployeeState>(
                  builder: (context, state) {
                    if (state is EmployeeLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is EmployeeEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is EmployeeError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is EmployeeLoaded) {
                      return Column(
                        children: [
                          for (int i = 0; i < state.employees.length; i++)
                            InkWell(
                              onTap: () {
                                Navigator.pop(
                                    context, {'employee': state.employees[i]});
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(state.employees[i].name ?? ""),
                                  const Divider()
                                ],
                              ),
                            ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
      actions: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("Close")),
      ],
    );
  }
}
