

import 'package:employeeprovider/model/employee_model.dart';

class EmployeeViewModels {

  EmployeeModel employeeModel;

  EmployeeViewModels({EmployeeModel emp}):employeeModel=emp;


  String get title=>employeeModel.title;

  String get author=>employeeModel.author;

  String get description=>employeeModel.description;

  String get publishAt=>employeeModel.publishAt;

  String get content=>employeeModel.content;

  String get urlToImage=>employeeModel.urlToImage;

}
