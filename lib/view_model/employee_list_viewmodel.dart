import 'package:employeeprovider/model/employee_model.dart';
import 'package:employeeprovider/view_model/employee_get_listmodels.dart';
import 'package:employeeprovider/view_model/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}

class EmployeeListViewModel with ChangeNotifier{

  LoadingStatus loadingStatus=LoadingStatus.empty;

  List<EmployeeViewModels> articles=List<EmployeeViewModels>();

  void headLines()async{

    List<EmployeeModel> newsArticle=await WebService().fetchDetails();

    loadingStatus=LoadingStatus.searching;

    this.articles=newsArticle.map((e) => EmployeeViewModels(emp: e)).toList();

    if(this.articles.isEmpty){

      this.loadingStatus=LoadingStatus.empty;
    }else{

      this.loadingStatus=LoadingStatus.completed;
    }

    notifyListeners();
  }
}