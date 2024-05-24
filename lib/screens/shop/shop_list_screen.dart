import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/shop/shop_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/screens/shop/widgets/shop_create_form.dart';
import 'package:sunhope_computer_software/screens/shop/widgets/shop_edit_form.dart';

import '../../core/log/debug_log.dart';
import '../../widgets/input_field.dart';
import '../../widgets/state_widgets.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({super.key});

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  final _getBloc = GetShopBloc();
  final _createBloc = CreateShopBloc();
  final _updateBloc = UpdateShopBloc();
  final _search = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getBloc.add(GetShopEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shops"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          BlocProvider(
            create: (_) => _createBloc,
            child: BlocListener<CreateShopBloc, ShopState>(
              listener: (context, state) {
                if (state is ShopCreating) {
                  StateWidgets.showLoading(context);
                } else if (state is ShopCreated) {
                  StateWidgets.hideLoading(context);
                  _getBloc.add(GetShopEvent());
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Success",
                      message: "New shop is created successful",
                      onPressedOK: () {
                        Navigator.pop(context);
                      });
                } else if (state is ShopError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Fail",
                      message: "New shop can not be created!",
                      onPressedOK: () {
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<CreateShopBloc, ShopState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _updateBloc,
            child: BlocListener<UpdateShopBloc, ShopState>(
              listener: (context, state) {
                if (state is ShopUpdating) {
                  StateWidgets.showLoading(context);
                } else if (state is ShopUpdated) {
                  StateWidgets.hideLoading(context);
                  _getBloc.add(GetShopEvent());
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Success",
                      message: "Shop is updated successful",
                      onPressedOK: () {
                        Navigator.pop(context);
                      });
                } else if (state is ShopError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      context: context,
                      title: "Fail",
                      message: "Shop can not be updated!",
                      onPressedOK: () {
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<UpdateShopBloc, ShopState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _getBloc,
              child: BlocListener<GetShopBloc, ShopState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetShopBloc, ShopState>(
                  builder: (context, state) {
                    if (state is ShopLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ShopEmpty) {
                      return const Center(child: Text("Empty Data!"));
                    } else if (state is ShopError) {
                      return const Center(child: Text("Network Error :("));
                    } else if (state is ShopLoaded) {
                      final shops = state.shops;
                      return ListView(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('No.',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('username',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Address',
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
                              for (int i = 0; i < shops.length; i++)
                                DataRow(cells: [
                                  DataCell(Text('${i + 1}')),
                                  DataCell(Text("${shops[i].name}")),
                                  DataCell(Text("${shops[i].username}")),
                                  DataCell(Text("${shops[i].address}")),
                                  DataCell(
                                    InkWell(
                                        onTap: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (_) => ShopEditForm(
                                                    shop: shops[i],
                                                    onUpdate: (shop) {
                                                      debugLog(shop);
                                                      _updateBloc.add(
                                                          UpdateShopEvent(
                                                              shop: shop));
                                                    },
                                                  ));
                                        },
                                        child: const Text(
                                          "Edit",
                                          style: ConstTextStyles.blueF14W4,
                                        )),
                                  ),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => ShopCreateForm(
                    onCreate: (shop) {
                      _createBloc.add(CreateShopEvent(shop: shop));
                    },
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
