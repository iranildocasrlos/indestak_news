import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:indestak_news/models/category_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io' as Plataforma;

List<CategoryModel>getCategories(){
     List<CategoryModel> listCategory = [];
     String appLocale = Plataforma.Platform.localeName;


     //API KEY :  https://newsapi.org/v2/everything?q=tesla&from=2022-02-21&sortBy=publishedAt&apiKey=1bc7955b268d4676be11952421184021

     //1
     CategoryModel categoryModel = new CategoryModel();
     categoryModel.categoryName = appLocale.contains("pt")? "Negócios": "Business";
     categoryModel.urlImage = "https://images.unsplash.com/photo-1425421669292-0c3da3b8f529?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80";
     listCategory.add(categoryModel);

     //2
     categoryModel = new CategoryModel();
     categoryModel.categoryName = appLocale.contains("pt")?"Entreterimento" : "Entertainment";
     categoryModel.urlImage = "https://images.unsplash.com/photo-1608638562455-bc8927d3abd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1375&q=80";
     listCategory.add(categoryModel);

     //3
     // categoryModel = new CategoryModel();
     // categoryModel.categoryName = "Politics";
     // categoryModel.urlImage = "https://images.unsplash.com/photo-1591621840289-b58dbede62e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80";
     // listCategory.add(categoryModel);

     //4
     categoryModel = new CategoryModel();
     categoryModel.categoryName = appLocale.contains("pt")?"Saúde"  : "Health";
     categoryModel.urlImage = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
     listCategory.add(categoryModel);

     //5
     categoryModel = new CategoryModel();
     categoryModel.categoryName = appLocale.contains("pt")?"Ciências": "Science";
     categoryModel.urlImage = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
     listCategory.add(categoryModel);

     //6
     categoryModel = new CategoryModel();
     categoryModel.categoryName= appLocale.contains("pt")?"Esportes" :"Sports";
     categoryModel.urlImage = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
     listCategory.add(categoryModel);

     //7
     categoryModel = new CategoryModel();
     categoryModel.categoryName= appLocale.contains("pt")? "Tecnologia":"Technology";
     categoryModel.urlImage = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
     listCategory.add(categoryModel);

     return listCategory;

}

   String getApiKey(String key){
       // Por local https://api.thenewsapi.com/v1/news/headlines?locale=us&language=en&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD
       //  todas    "https://api.thenewsapi.com/v1/news/all?api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";
        // String apiKey = "https://api.thenewsapi.com/v1/news/all?locale=pt&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";
        //   String apiKey = "https://newsapi.org/v2/top-headlines?country=br&apiKey=1bc7955b268d4676be11952421184021";
        String appLocale = Plataforma.Platform.localeName;
        String apiKey ;

        if(appLocale == "pt_BR") {
             if (key.contains(
                 "https://api.thenewsapi.com/v1/news/all?locale=pt&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD")) {
                  if (key == null) {
                       apiKey =
                       "https://api.thenewsapi.com/v1/news/all?locale=pt&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";
                  } else {
                       apiKey = key;
                  }
                  return apiKey;
             } else {
                  if (key == null) {
                       apiKey =
                       "https://newsapi.org/v2/top-headlines?country=br&apiKey=1bc7955b268d4676be11952421184021";
                  } else {
                       apiKey = key;
                  }
                  return apiKey;
             }
        }else{
             if (key.contains(
                 "https://api.thenewsapi.com/v1/news/all?locale=us&language=en&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD")) {
                  if (key == null) {
                       apiKey =
                       "https://api.thenewsapi.com/v1/news/all?locale=us&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";
                  } else {
                       apiKey = key;
                  }
                  return apiKey;
             } else {
                  if (key == null) {
                       apiKey =
                       "https://newsapi.org/v2/top-headlines?country=us&apiKey=1bc7955b268d4676be11952421184021";
                  } else {
                       apiKey = key;
                  }
                  return apiKey;
             }
        }

            // apiKey = "https://newsapi.org/v2/top-headlines?country=br&apiKey=1bc7955b268d4676be11952421184021";
            // apiKey = "https://api.thenewsapi.com/v1/news/top?locale=pt&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD";



   }