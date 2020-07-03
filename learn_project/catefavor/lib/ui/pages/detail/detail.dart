import 'package:catefavor/core/model/meal_model.dart';
import 'package:catefavor/ui/pages/detail/detail_content.dart';
import 'package:catefavor/ui/pages/detail/detail_floating_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context).settings.arguments as FHMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: FHDetailContent(meal),
      floatingActionButton: FHDetailFloatingButton(meal),
    );
  }
}
