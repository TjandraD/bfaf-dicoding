import 'package:flutter/material.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:news_app/ui/article_detail_page.dart';
import 'package:provider/provider.dart';
import '../data/model/article.dart';
import '../common/styles.dart';

class CardArticle extends StatelessWidget {
  final Article article;
  final Function onPressed;

  CardArticle({@required this.article, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              color: primaryColor,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                trailing: isBookmarked
                    ? IconButton(
                        icon: Icon(Icons.bookmark),
                        onPressed: () => provider.removeBookmark(article.url),
                      )
                    : IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () => provider.addBookmark(article),
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
                onTap: () => Navigation.intentWithData(
                    ArticleDetailPage.routeName, article),
              ),
            );
          },
        );
      },
    );
  }
}
