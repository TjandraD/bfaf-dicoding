import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'widgets/custom_scaffold.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/artile_web';

  final String url;

  ArticleWebView({@required this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
