// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class getData with ChangeNotifier{
  List<ListData> data = [];

  Future getListData() async{
    // var response =
    // await http.get(
    //     Uri.parse('https://picsum.photos/v2/list?page=pageNumber&limit=20'));
      String filePath =  'E:/Qouets Project App/Recourses/quotes-master/Art.json';
  File file = await File(filePath);
  String jsonString = await file.readAsString();
  final data = json.decode(jsonString);
   
    for(var u in data){
      ListData list = ListData(u["name"],u["quote"]);
      data.add(list);
    }

    notifyListeners();
    return data;
  }
}

class ListData{
  final String  author,quote;

  ListData(this.author, this.quote);
 
}