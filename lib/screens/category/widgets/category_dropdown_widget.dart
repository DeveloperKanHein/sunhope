import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/category/category_bloc.dart';
import '../../../constants/const_colors.dart';
import '../../../data/category.dart';
import '../../../widgets/state_widgets.dart';

class CategoryDropdownWidget extends StatefulWidget {
  final Function(Category?) onChoose;
  const CategoryDropdownWidget({super.key, required this.onChoose});

  @override
  State<CategoryDropdownWidget> createState() => _CategoryDropdownWidgetState();
}

class _CategoryDropdownWidgetState extends State<CategoryDropdownWidget> {
  final _bloc = GetCategoryBloc();
  List<Category> _categories = [];
  Category? category;
  String? categoryId;

  String? getNameById(String? id) {
    for (int i = 0; i < _categories.length; i++) {
      if (_categories[i].id == id) {
        return _categories[i].name;
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<GetCategoryBloc, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoaded) {
            _categories = state.categories;
            if (state.categories.isNotEmpty) {
              widget.onChoose(state.categories[0]);
              setState(() {
                categoryId = state.categories[0].id;
              });
            }
          }
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
              return Container(
                height: 30,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: ConstColors.borderColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Category>(
                    focusColor: Colors.transparent,
                    isExpanded: true,
                    elevation: 8,
                    value: category,
                    alignment: AlignmentDirectional.bottomStart,
                    items: state.categories.map((Category category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name ?? ""),
                      );
                    }).toList(),
                    onChanged: (cat) {
                      widget.onChoose(cat);
                      setState(() {
                        category = cat;
                      });
                    },
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
