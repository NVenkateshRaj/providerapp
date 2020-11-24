import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:employeeprovider/view/details_news_screen.dart';
import 'package:employeeprovider/view_model/employee_get_listmodels.dart';
import 'package:employeeprovider/view_model/employee_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeScreen extends StatefulWidget {
  @override
  NewsScreenState createState()=>NewsScreenState();
}


class NewsScreenState extends State<EmployeeScreen>{
  bool isSplash=true;

  @override
  void initState() {
    super.initState();
    Provider.of<EmployeeListViewModel>(context,listen: false).headLines();
    Timer(Duration(seconds: 5), () {
      setState(() {
        isSplash=false;
      });
    });
  }

  @override
  Widget build(BuildContext context){
    var listViewModel=Provider.of<EmployeeListViewModel>(context);
    return isSplash?Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(3),
              width: double.infinity,
              height: double.infinity,
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/1.jpg",),
              ),
            )
          ],
        ),
      ),
    ):Scaffold(
        appBar: AppBar(title: Text("Home Page",style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,
        ),
        body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                child: Text("Head Line",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),),
              ),
              Expanded(
                child: NewsGrid(articles: listViewModel.articles,),
              )
            ],
          ),
        )
    );
  }
}


class NewsGrid extends StatelessWidget {
  final List<EmployeeViewModels> articles;
  NewsGrid({this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        var article=articles[index];
        print(article.title);
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetails(title: article.title,content: article.content,url: article.urlToImage,publishedAt: article.publishAt,)));
          },
          child: Container(
            margin: EdgeInsets.all(6),
            child: Card(
              color: Colors.grey[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text("Title :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                          ),
                          Flexible(
                            child: Text(article.title,softWrap: true,overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text("Content :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                          ),
                          Flexible(
                            child: Text(article.content!=null?article.content:"No Result Founds...",softWrap: true,overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text("PublishedAt :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                          ),
                          Flexible(
                            child: Text(article.publishAt,softWrap: true,overflow: TextOverflow.ellipsis,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: CachedNetworkImage(
                        imageUrl:  article.urlToImage!=null?article.urlToImage:"https://images.wsj.net/im-262803/social",
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                            CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
                  ],
                )
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }


}