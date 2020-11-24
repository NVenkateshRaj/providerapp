import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:employeeprovider/model/employee_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class WebService{
  Dio dio=Dio();

  Future<List<EmployeeModel>> fetchDetails()async{


    try{
      final response=await dio.get('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=be57fe98b31f4a77b3d8b6097385b041');

      if(response.statusCode==200){
        final result=response.data;
        print(response.data);
        Iterable list=result['articles'];
        return list.map((e) => EmployeeModel.fromJson(e)).toList();
      }
      else{
        throw Exception("Failed to load");
      }
    }
    catch(e){
      print(e);
    }

  }

}