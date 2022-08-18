import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  Object? categoryID;
  Object? categoryID2;
  Object? categoryID3;
  Object? categoryID4;
  DateTime? selectedDate;
  DateTime? selectedDate2;
  // var states = ['kozhikode', 'kochi', 'idukki'];
  // var branch = ['calicut beach', 'Thondayad', 'Mananchira'];
  var states = ['kozhikode', 'kochi', 'idukki'];
  var states2 = ['kozhikode', 'kochi', 'idukki'];
  var branch = [];
  var branch2 = [];
  final count = 0.obs;
  String startDate = 'Start-Date';
  String endDate = 'End-Date';
  bool visibility = false;
  bool visibility2 = false;
  @override
  void onClose() {}
  void increment() => count.value++;
  //   newone( e) {
  //   selectedCategoryModel = e;
  //   update();
  // }
  changeModel(dynamic value) {
    categoryID2 = null;
    categoryID = null;
    branch.clear();
    categoryID = value;
    if (value == 'kozhikode') {
      branch = ['calicut beach', 'Thondayad', 'Mananchira'];
    } else if (value == 'kochi') {
      branch = ['Vytila', 'Edapally', 'Kakkanad'];
    } else {
      branch = [];
    }

    update();
  }

  changeModel2(dynamic value) {
    categoryID2 = value;
    update();
  }

  dropOffchangeModel(dynamic value) {
    categoryID3 = null;
    categoryID4 = null;
    branch2.clear();
    categoryID3 = value;
    if (value == 'kozhikode') {
      branch2 = ['calicut beach', 'Thondayad', 'Mananchira'];
    } else if (value == 'kochi') {
      branch2 = ['Vytila', 'Edapally', 'Kakkanad'];
    } else {
      branch2 = [];
    }
    update();
  }

  dropOffchangeModel2(dynamic value) {
    categoryID4 = value;
    update();
  }

  selectState() {
    visibility = true;
    update();
  }

  selectState2() {
    visibility2 = true;
    update();
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromARGB(255, 0, 0, 0), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
                onSurface: Color.fromARGB(255, 0, 0, 0), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0), // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
    selectedDate = picked ?? DateTime.now();
    startDate =
        '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';

    update();
  }

  Future selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromARGB(255, 0, 0, 0), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
                onSurface: Color.fromARGB(255, 0, 0, 0), // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0), // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
    selectedDate2 = picked ?? DateTime.now();
    endDate =
        '${selectedDate2!.day}/${selectedDate2!.month}/${selectedDate2!.year}';
    update();
  }
}
