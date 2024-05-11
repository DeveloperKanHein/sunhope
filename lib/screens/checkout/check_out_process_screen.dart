import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunhope_computer_software/blocs/purchase/purchase_bloc.dart';
import 'package:sunhope_computer_software/constants/const_colors.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/show_price.dart';
import 'package:sunhope_computer_software/data/purchase.dart';
import 'package:sunhope_computer_software/screens/customer/choose_customer_screen.dart';
import 'package:sunhope_computer_software/screens/employee/choose_employee_screen.dart';
import 'package:sunhope_computer_software/screens/employee/widgets/employee_dropdown_widget.dart';
import 'package:sunhope_computer_software/widgets/state_widgets.dart';
import 'package:uuid/uuid.dart';
import '../../core/checkout_service_handler/checkout_service_handler.dart';
import '../../data/customer.dart';
import '../../data/employee.dart';
import '../../data/service_req.dart';
import 'finger_scan_widget.dart';

class CheckOutProcessScreen extends StatefulWidget {
  final Function(bool) close;
  const CheckOutProcessScreen({super.key, required this.close});

  @override
  State<CheckOutProcessScreen> createState() => _CheckOutProcessScreenState();
}

class _CheckOutProcessScreenState extends State<CheckOutProcessScreen> {
  final CreatePurchaseBloc _bloc = CreatePurchaseBloc();
  Customer? customer;
  Employee? employee;
  String? guestName;
  // List<ServiceReq> CheckoutServiceHandler.services = [];
  int getTotal(List<ServiceReq> services) {
    int total = 0;
    for (ServiceReq service in services) {
      if (!service.isFoc!) {
        total += service.quantity! * (service.price! - service.discount!);
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (_) => _bloc,
          child: BlocListener<CreatePurchaseBloc, PurchaseState>(
            listener: (context, state) {
              if (state is PurchaseCreating) {
                StateWidgets.showLoading(context);
              } else if (state is PurchaseCreated) {
                StateWidgets.hideLoading(context);

                setState(() {
                  CheckoutServiceHandler.clear();
                });
                StateWidgets.showAlertMessage(
                    context: context,
                    title: "Success",
                    message: "Checkout Complete Successfully.",
                    onPressedOK: () {
                      StateWidgets.hideLoading(context);
                      widget.close(true);
                    });
              } else if (state is PurchaseError) {
                StateWidgets.hideLoading(context);
                StateWidgets.showAlertMessage(
                    context: context,
                    title: "Fail",
                    message: "Checkout can not be process.",
                    onPressedOK: () {
                      StateWidgets.hideLoading(context);
                      widget.close(true);
                    });
              }
            },
            child: BlocBuilder<CreatePurchaseBloc, PurchaseState>(
              builder: (context, state) {
                return Container();
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 20),
          child: Row(
            children: [
              customer == null
                  ? TextButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    // duration: const Duration(milliseconds: ConstValues.routeDuration),
                                    child: const ChooseCustomerScreen()))
                            .then((value) {
                          setState(() {
                            customer = value["customer"];
                          });
                        });
                      },
                      child: const Text("Choose Customer"))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        // duration: const Duration(milliseconds: ConstValues.routeDuration),
                                        child: const ChooseCustomerScreen()))
                                .then((value) {
                              setState(() {
                                customer = value["customer"];
                              });
                            });
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.person,
                                  color: ConstColors.borderColor),
                              Text(customer!.name ?? '',
                                  style: ConstTextStyles.blackF14W4Op45),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            const Icon(Icons.phone,
                                color: ConstColors.borderColor),
                            Text(customer!.phone!.replaceAll(",", "\n"),
                                style: ConstTextStyles.blackF14W4Op45),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            const Icon(Icons.account_balance_wallet,
                                color: ConstColors.borderColor),
                            const SizedBox(width: 4),
                            Text(
                                showPrice(
                                  customer!.balance ?? 0,
                                ),
                                style: ConstTextStyles.blackF14W4Op45),
                          ],
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 30),
                child: InkWell(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => FingerScanWidget(
                                onSuccess: (name) {
                                  setState(() {
                                    guestName = name;
                                  });
                                },
                              ));
                    },
                    child: const Icon(
                      Icons.fingerprint,
                      size: 20,
                    )),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: const ChooseEmployeeScreen()))
                      .then((value) {
                    setState(() {
                      employee = value["employee"];
                    });
                  });
                },
                child: employee == null
                    ? const Text("Choose Employee")
                    : Text(employee!.name ?? ""),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: ListView(
            children: [
              DataTable(
                dataRowMaxHeight: 60,
                columns: const [
                  DataColumn(
                      label: Text('Service',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Quantity',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Discount',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Price',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Service Girl',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('FOC',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Action',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                ],
                rows: [
                  for (int i = 0;
                      i < CheckoutServiceHandler.services.length;
                      i++)
                    DataRow(cells: [
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(CheckoutServiceHandler.services[i].name ?? ""),
                          Text(CheckoutServiceHandler.services[i].nameCN ?? ""),
                        ],
                      )),
                      DataCell(Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "${CheckoutServiceHandler.services[i].quantity}"),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      CheckoutServiceHandler.services[i]
                                          .quantity = CheckoutServiceHandler
                                              .services[i].quantity! +
                                          1;
                                    });
                                  },
                                  child: const Icon(Icons.add)),
                              InkWell(
                                  onTap: () {
                                    if (CheckoutServiceHandler
                                            .services[i].quantity! >
                                        1) {
                                      setState(() {
                                        CheckoutServiceHandler.services[i]
                                            .quantity = CheckoutServiceHandler
                                                .services[i].quantity! -
                                            1;
                                      });
                                    }
                                  },
                                  child: const Icon(Icons.minimize)),
                            ],
                          ),
                        ],
                      )),
                      DataCell(Text(showPrice(int.parse(
                          '${CheckoutServiceHandler.services[i].discount}')))),
                      DataCell(Text(showPrice(int.parse(
                          '${CheckoutServiceHandler.services[i].price}')))),
                      DataCell(SizedBox(
                        width: 100,
                        height: 50,
                        child: EmployeeDropdownWidget(
                          onChoose: (Employee? employee) {
                            if (employee != null) {
                              setState(() {
                                CheckoutServiceHandler.services[i].employeeId =
                                    employee.id;
                                CheckoutServiceHandler
                                    .services[i].employeeName = employee.name;
                              });
                            }
                          },
                        ),
                      )),
                      DataCell(InkWell(
                        onTap: () {
                          setState(() {
                            CheckoutServiceHandler.services[i].isFoc =
                                !CheckoutServiceHandler.services[i].isFoc!;
                          });
                        },
                        child: Icon(CheckoutServiceHandler.services[i].isFoc!
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank),
                      )),
                      DataCell(
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    CheckoutServiceHandler.duplicate(
                                        CheckoutServiceHandler.services[i]);
                                  });
                                },
                                child: const Icon(
                                  Icons.copy,
                                  color: Colors.blue,
                                )),
                            const SizedBox(width: 20),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    CheckoutServiceHandler.services.removeAt(i);
                                  });
                                },
                                child: const Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      )
                    ]),
                  DataRow(cells: [
                    const DataCell(Text(
                      'Total',
                      style: ConstTextStyles.blackF16W5,
                    )),
                    DataCell(Container()),
                    DataCell(Container()),
                    DataCell(Text(
                      showPrice(getTotal(CheckoutServiceHandler.services)),
                      style: ConstTextStyles.blackF16W5,
                    )),
                    DataCell(Container()),
                    DataCell(Container()),
                    DataCell(Container()),
                  ]),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.close(true);
                  },
                  child: const Icon(Icons.arrow_back)),
              ElevatedButton(
                  onPressed: () {
                    _bloc.add(CreatePurchaseEvent(
                        purchase: Purchase(
                            customerId: customer!.id,
                            customerName: customer!.name,
                            guestName: guestName,
                            fingerId:
                                guestName != null ? const Uuid().v4() : null,
                            totalAmount:
                                getTotal(CheckoutServiceHandler.services),
                            services: CheckoutServiceHandler.toJsonList())));
                  },
                  child: const Icon(Icons.arrow_forward)),
            ],
          ),
        ),
      ],
    );
  }
}
