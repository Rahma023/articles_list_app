import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsapp/model/article_model.dart';

class ApiService{

  final endPoint="https://newsapi.org/v2/everything?q=tesla&from=2021-12-12&sortBy=publishedAt&apiKey=e8b9ce014ffc4b04bd3a86ad83547ed5";

  get endPointUrl => null;

Future<Iterable> getArticle() async{
  Response res = await get(endPointUrl);

  if(res.statusCode == 200){
    Map<String, dynamic> json = jsonDecode(res.body);

    List<dynamic> body = json['article'];

    Iterable articles = body.map((dynamic item) => Article.fromJson(item).toList());

    //List<Article> articles = body.map(dynamic item) => Article.fromJson(item).toList();
    return articles;

  }else{
    throw("Can't get the articles");
  }
}
}