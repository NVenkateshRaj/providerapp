class EmployeeModel{
  final String title,author,description,publishAt,content,urlToImage;

  EmployeeModel({this.title, this.author, this.description, this.publishAt, this.content,this.urlToImage});

  factory EmployeeModel.fromJson(Map<String,dynamic> json){
    return EmployeeModel(
        title: json['title'],
        author: json['author'],
        description: json['description'],
        content: json['content'],
        publishAt: json['publishedAt'],
        urlToImage:json['urlToImage']
    );
  }
}
