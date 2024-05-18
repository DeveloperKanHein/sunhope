import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/blocs/category/category_bloc.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/next_screen.dart';
import 'package:sunhope_computer_software/screens/service/service_list_screen.dart';
import 'widgets/category_create_form.dart';
import 'widgets/category_edit_form.dart';
import 'package:sunhope_computer_software/widgets/input_field.dart';

import '../../data/category.dart';
import '../../widgets/state_widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _search = TextEditingController();
  final GetCategoryBloc _getCategoryBloc = GetCategoryBloc();
  final CreateCategoryBloc _createCategoryBloc = CreateCategoryBloc();
  final UpdateCategoryBloc _updateCategoryBloc = UpdateCategoryBloc();

  @override
  void initState() {
    super.initState();
    _getCategoryBloc.add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
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
      body: Column(
        children: [
          BlocProvider(
            create: (_) => _createCategoryBloc,
            child: BlocListener<CreateCategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryCreating) {
                  StateWidgets.showLoading(context);
                } else if (state is CategoryCreated) {
                  StateWidgets.hideLoading(context);
                  _getCategoryBloc.add(GetCategoryEvent());
                  StateWidgets.showAlertMessage(
                      title: "Success",
                      message: "New category is created successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is CategoryError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "New category can not be created!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<CreateCategoryBloc, CategoryState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _updateCategoryBloc,
            child: BlocListener<UpdateCategoryBloc, CategoryState>(
              listener: (context, state) {
                if (state is CategoryUpdating) {
                  StateWidgets.showLoading(context);
                } else if (state is CategoryUpdated) {
                  StateWidgets.hideLoading(context);
                  _getCategoryBloc.add(GetCategoryEvent());
                  StateWidgets.showAlertMessage(
                      title: "Successful",
                      message: "Category is updated successfully.",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                } else if (state is CategoryError) {
                  StateWidgets.hideLoading(context);
                  StateWidgets.showAlertMessage(
                      title: "Error",
                      message: "Category can not be updated!",
                      context: context,
                      onPressedOK: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }
              },
              child: BlocBuilder<UpdateCategoryBloc, CategoryState>(
                builder: (context, state) {
                  return Container();
                },
              ),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => _getCategoryBloc,
              child: BlocListener<GetCategoryBloc, CategoryState>(
                listener: (context, state) {
                  //
                },
                child: BlocBuilder<GetCategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return StateWidgets.loadingWidget;
                    } else if (state is CategoryEmpty) {
                      return StateWidgets.emptyWidget;
                    } else if (state is CategoryError) {
                      return StateWidgets.networkErrorWidget;
                    } else if (state is CategoryLoaded) {
                      final categories = state.categories;
                      return ListView(
                        children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                  label: Text('Name',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              DataColumn(
                                  label: Text('Name (Chinese)',
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
                              for (int i = 0; i < categories.length; i++)
                                DataRow(cells: [
                                  DataCell(
                                    Text(categories[i].name ?? ""),
                                  ),
                                  DataCell(
                                    Text(categories[i].nameCN ?? ""),
                                  ),
                                  DataCell(Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (_) =>
                                                    CategoryEditForm(
                                                      onUpdate:
                                                          (Category category) {
                                                        _updateCategoryBloc.add(
                                                            UpdateCategoryEvent(
                                                                category:
                                                                    category));
                                                      },
                                                      category: categories[i],
                                                    ));
                                          },
                                          child: const Text(
                                            "Edit",
                                            style: ConstTextStyles.blueF14W4,
                                          )),
                                      const SizedBox(width: 15),
                                      InkWell(
                                          onTap: () {
                                            nextStfScreen(
                                                context: context,
                                                screen: ServiceListScreen(
                                                  categoryId: categories[i].id,
                                                ));
                                          },
                                          child: Text(
                                            "Detail",
                                            style:
                                                ConstTextStyles.blackF14W4Op65,
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => CategoryCreateForm(
                    onCreate: (Category category) {
                      _createCategoryBloc
                          .add(CreateCategoryEvent(category: category));
                    },
                  ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
