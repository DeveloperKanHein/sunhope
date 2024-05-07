import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/service/service_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/screens/service/widgets/service_create_form.dart';
import 'package:sunhope_computer_software/screens/service/widgets/service_detail.dart';
import 'package:sunhope_computer_software/screens/service/widgets/service_edit_form.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';

import '../../data/service.dart';
import '../../widgets/state_widgets.dart';

class ServiceListScreen extends StatefulWidget {
  final String? categoryId;
  const ServiceListScreen({super.key, this.categoryId});

  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends State<ServiceListScreen> {
  final _search = TextEditingController();
  final GetServiceBloc _getServiceBloc = GetServiceBloc();
  final CreateServiceBloc _createServiceBloc = CreateServiceBloc();
  final UpdateServiceBloc _updateServiceBloc = UpdateServiceBloc();
  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      _getServiceBloc
          .add(GetServiceByCategoryEvent(id: widget.categoryId ?? ""));
    } else {
      _getServiceBloc.add(GetServiceEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: SizedBox(
        //         width: 200,
        //         height: 50,
        //         child: InputField(
        //           controller: _search,
        //           label: "Search",
        //           onTyping: (_) {},
        //           suffixWidget: const Icon(
        //             Icons.search,
        //             size: 24,
        //           ),
        //         )),
        //   ),
        // ],
      ),
      body: Stack(
        children: [
          BlocProvider(
            create: (_) => _createServiceBloc,
            child: BlocListener<CreateServiceBloc, ServiceState>(
              listener: (context, state) {
                if (state is ServiceCreating) {
                  StateWidgets.showLoading(context);
                } else if (state is ServiceCreated) {
                  StateWidgets.hideLoading(context);
                  _getServiceBloc.add(GetServiceEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "New service is created successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is ServiceError) {
                  StateWidgets.hideLoading(context);

                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "New service can not be created!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<CreateServiceBloc, ServiceState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _updateServiceBloc,
            child: BlocListener<UpdateServiceBloc, ServiceState>(
              listener: (context, state) {
                if (state is ServiceUpdating) {
                  StateWidgets.showLoading(context);
                } else if (state is ServiceUpdated) {
                  StateWidgets.hideLoading(context);
                  _getServiceBloc.add(GetServiceEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "Service is updated successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is ServiceError) {
                  StateWidgets.hideLoading(context);

                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "Service can not be updated!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<UpdateServiceBloc, ServiceState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _getServiceBloc,
            child: BlocListener<GetServiceBloc, ServiceState>(
              listener: (context, state) {
                //
              },
              child: BlocBuilder<GetServiceBloc, ServiceState>(
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return StateWidgets.loadingWidget;
                  } else if (state is ServiceEmpty) {
                    return StateWidgets.emptyWidget;
                  } else if (state is ServiceError) {
                    return StateWidgets.networkErrorWidget;
                  } else if (state is ServiceLoaded) {
                    final services = state.services;
                    return ListView(
                      children: [
                        DataTable(
                          columns: const [
                            DataColumn(
                                label: Text('Service',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Price',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Discount',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Description',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Action',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: [
                            for (int i = 0; i < services.length; i++)
                              DataRow(cells: [
                                DataCell(Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(services[i].name ?? ""),
                                    Text(services[i].nameCN ?? ""),
                                  ],
                                )),
                                DataCell(
                                    Text(showPrice(services[i].price ?? 0))),
                                DataCell(
                                    Text(showPrice(services[i].discount ?? 0))),
                                DataCell(SizedBox(
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        services[i].description ?? "",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        services[i].descriptionCN ?? "",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )),
                                DataCell(Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (_) => ServiceEditForm(
                                                    service: services[i],
                                                    onUpdate:
                                                        (Service service) {
                                                      _updateServiceBloc.add(
                                                          UpdateServiceEvent(
                                                              service:
                                                                  service));
                                                    },
                                                  ));
                                        },
                                        child: const Text(
                                          "Edit",
                                          style: ConstTextStyles.blueF14W4,
                                        )),
                                    const SizedBox(width: 15),
                                    InkWell(
                                        onTap: () {
                                          showDialog(
                                              // barrierDismissible: false,
                                              context: context,
                                              builder: (_) => ServiceDetail(
                                                    service: services[i],
                                                  ));
                                        },
                                        child: Text(
                                          "Detail",
                                          style: ConstTextStyles.blackF14W4Op65,
                                        )),
                                  ],
                                )),
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
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (_) => ServiceCreateForm(
                          onCreate: (Service service) {
                            _createServiceBloc
                                .add(CreateServiceEvent(service: service));
                          },
                        ));
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
