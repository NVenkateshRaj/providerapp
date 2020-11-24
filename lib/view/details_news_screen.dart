import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget{
  @override
  _NewsState createState()=>_NewsState();

  final String title,content,publishedAt,url;

  NewsDetails({this.title,this.content,this.publishedAt,this.url});
}

class _NewsState extends State<NewsDetails>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page",style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Title",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),)
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Text("${widget.title}")
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 100,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: widget.url!=null?widget.url:"https://images.wsj.net/im-262803/social",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Content",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),)
              ),
              Container(
                  margin: EdgeInsets.all(5),
                  child: Text("${widget.content}",style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}