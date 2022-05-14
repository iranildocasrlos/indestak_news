import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indestak_news/helper/data.dart';
import 'package:indestak_news/helper/news.dart';
import 'package:indestak_news/models/articleModel.dart';
import 'package:indestak_news/models/category_models.dart';
import 'package:indestak_news/views/article_view.dart';
import 'package:indestak_news/views/category_news.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List <CategoryModel> categorias = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  String localizacao = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categorias = getCategories();
    getNews();

  }

  getNews() async{
    News newsRec = News();
    await newsRec.getNews();
    articles = newsRec.news;

    if(newsRec.news.isEmpty ){

      newsRec = News(key: "https://api.thenewsapi.com/v1/news/all?locale=pt&language=pt&api_token=2nQgAGaAIJXJSbqBbxKQO7hv9JWnlqdCGiunv5lD");
      await newsRec.getNews();
      articles = newsRec.news;
    }

    setState(() {
      _loading = false;
    });
  }




  @override
  Widget build(BuildContext context) {

    String appLocale = Intl.getCurrentLocale().toString();
    print("Local do App: $appLocale");
    localizacao = appLocale;

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
      ),

      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :  SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),

          child: Column(
                 children: [

                   /// Categotias
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: categorias.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (conttext, index){
                            return CategoryTile(
                              imageUrl: categorias[index].urlImage,
                              categoryName: categorias[index].categoryName
                            );
                          }),
                    ),


                   /// Blogs
                   Container(
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

                 ],
              ),
            ),
      ),
     
      );


  }
}

class CategoryTile extends StatelessWidget {

  final String  imageUrl, categoryName;
  CategoryTile({
    required this.imageUrl,
    required this.categoryName
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
                categoryName.toLowerCase(),
             )
           )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,),

              ),
              Container(
                alignment: Alignment.center,
                width: 120, height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),

                child:  Text(categoryName, style: TextStyle(
                    color: Colors.white,

                  fontSize: 14,
                  fontWeight: FontWeight.w500
                  ),
                ) ,
              )


          ],
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
        margin: EdgeInsets.only(bottom: 16),
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

