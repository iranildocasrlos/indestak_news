import 'package:flutter/material.dart';

import '../helper/news.dart';
import '../models/articleModel.dart';
import '../models/category_models.dart';
import 'article_view.dart';
import 'home.dart';

class CategoryNews extends StatefulWidget {
  final String category;
 CategoryNews(this.category) ;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List <CategoryModel> categorias = [];
  List<ArticleModel> articles = [];
  String localizacao = '';
  bool _loading = true;

  getCategoryNews() async{
    CategoryNewsClass newsRec = CategoryNewsClass();
    await newsRec.getNews(widget.category);
    articles = newsRec.news;

    if(newsRec.news.isEmpty ){
    //  newsRec = News(key: "https://api.thenewsapi.com/v1/news/all?locale=pt&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD");
      await newsRec.getNews(widget.category);
      articles = newsRec.news;
    }
    setState(() {
      _loading = false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Indestak",
              style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text("News",
              style: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,

        actions: [
          Opacity(opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.save)
            ),
          )
        ],

      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: articles.length ,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index){
                return BlogTile(
                  imageUrl: articles[index].urlToImage,
                  title: articles[index].title,
                  description: articles[index].description,
                  url: articles[index].url,
                );
              }),
        ),
      ),

    );

  }
}


// Bloco dos de notícias
class BlogTile extends StatelessWidget {
  final String imageUrl, title, description,url;

  BlogTile({ required this.imageUrl,
    required this.title,
    required this.description,
    required this.url

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>  ArticleView(
              blogUrl: url,
            )
        )
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16,left: 8,right: 8),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)
            ),
            SizedBox(height: 8,) ,
            Text(title, style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            )
            ),
            SizedBox(height: 8,) ,
            Text(description,
              style: TextStyle(
                  color: Colors.black54

              ),
            )
          ],
        ),
      ),
    );
  }
}


