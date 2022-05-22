import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/articleModel.dart';
import '../helper/data.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as Plataforma;

class News {
  List<ArticleModel> news = [];
  final String key;


  News(
  {required this.key}
      );

  Future<void> getNews() async{
    String url = getApiKey(key);
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    String author, title,desc,urlString,url_to_image,content;



    if(jsonData["status"]== "ok"){

      if(jsonData["articles"] != null){
        jsonData["articles"].forEach((element){
          if(element["author"] != null){
            author = element["author"];
          }else{
            author = "NewsApi";
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
          if(element["urlToImage"] != null){
            url_to_image = element["urlToImage"];
          }else{
            url_to_image = "";
          }
          if(element["content"] != null){
            content = element["content"];
          }else{
            content = "";
          }



          if(element["urlToImage"] != null ){
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

    }else{





      if(jsonData["data"] != null){
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


}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  String appLocale = Plataforma.Platform.localeName;

  Future<void> getNews(String category) async{
    String key ="";
    if(appLocale == "pt_BR") {
      key = "https://newsapi.org/v2/top-headlines?category=$category&country=br&apiKey=1bc7955b268d4676be11952421184021";
      if (category == "politics") {
        key =
        "https://api.thenewsapi.com/v1/news/all?locale=br&language=pt&categories=politics&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";
      }
    } else if (appLocale == "en_US") {
      key = "https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=1bc7955b268d4676be11952421184021";
      if (category == "politics") {
        key =
        "https://api.thenewsapi.com/v1/news/all?locale=us&language=en&categories=politics&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";
      }
    }

    String url = getApiKey(key);
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    String author, title,desc,urlString,url_to_image,content, categoria;



    //Fonte : https://newsapi.org/docs/endpoints/top-headlines
    if(jsonData["status"]== "ok"){

      if(jsonData["articles"] != null){
        jsonData["articles"].forEach((element){
          if(element["author"] != null){
            author = element["author"];
          }else{
            author = "NewsApi";
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
          if(element["urlToImage"] != null){
            url_to_image = element["urlToImage"];
          }else{
            url_to_image = "";
          }
          if(element["content"] != null){
            content = element["content"];
          }else{
            content = "";
          }

          if(element["urlToImage"] != null ){
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

    }else {
      //Fonte
      //https://www.thenewsapi.com/documentation

      if (jsonData["data"] != null) {
        jsonData["data"].forEach((element) {

              if (element["author"] != null) {
                author = element["author"];
              } else {
                author = "TheNewsAPI";
              }
              if (element["title"] != null) {
                title = element["title"];
              } else {
                title = "News Indestak";
              }
              if (element["description"] != null) {
                desc = element["description"];
              } else {
                desc = "News Indestak";
              }
              if (element["url"] != null) {
                urlString = element["url"];
              } else {
                urlString = "";
              }
              if (element["image_url"] != null) {
                url_to_image = element["image_url"];
              } else {
                url_to_image = "";
              }
              if (element["snippet"] != null) {
                content = element["snippet"];
              } else {
                content = "";
              }


              if (element["image_url"] != null) {
                ArticleModel article = ArticleModel(
                    author: author,
                    title: title,
                    description: desc,
                    url: urlString,
                    urlToImage: url_to_image,
                    content: content
                );
                if (element["description"] != null) {
                  news.add(article);
                }
              }

        });
      }


    }



  }


}