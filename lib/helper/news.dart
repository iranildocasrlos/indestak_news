import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/articleModel.dart';
import '../helper/data.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];



  Future<void> getNews(String local) async{
    String url = getApiKey(local);
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    String author, title,desc,urlString,url_to_image,content;



    print("retorno Meta: ${jsonData["status"]}");
    if(jsonData["status"] != "error"){
      jsonData["data"].forEach((element){
        if(element["author"] != null){
          author = element["author"];
        }else{
          author = "TheNewsAPI";
        }
        if(element["title"] != null){
          title = element["title"];
        }else{
          title = "News Indestak";
        }
        if(element["description"] != null){
          desc = element["description"];
        }else{
          desc = "News Indestak";
        }
        if(element["url"] != null){
          urlString = element["url"];
        }else{
          urlString = "";
        }
        if(element["image_url"] != null){
          url_to_image = element["image_url"];
        }else{
          url_to_image = "";
        }
        if(element["snippet"] != null){
          content = element["snippet"];
        }else{
          content = "";
        }



        if(element["image_url"] != null ){
          ArticleModel article =  ArticleModel(
              author: author,
              title: title,
              description: desc,
              url: urlString,
              urlToImage: url_to_image,
              content: content
          );
          if(element["description"] != null){
            news.add(article);
          }

        }
      });
    }

  }


}