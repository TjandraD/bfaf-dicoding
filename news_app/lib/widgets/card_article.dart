import 'package:flutter/material.dart';
import '../data/model/article.dart';
import '../common/styles.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  final Function onPressed;

  CardArticle({@required this.article, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        leading: article.urlToImage == null
            ? Container(
                width: 100.0,
                child: Icon(Icons.error),
              )
            : Hero(
                tag: article.urlToImage,
                child: Image.network(article.urlToImage)),
        title: Text(article.title ?? ""),
        onTap: onPressed,
      ),
    );
  }
}
