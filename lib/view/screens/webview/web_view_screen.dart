import 'package:flutter/material.dart';
import 'package:last_news/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key, this.newsModelObj});

  final Articles? newsModelObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView')),
      body: WebView(
        initialUrl: newsModelObj?.url ?? "",
      ),
    );
  }
}
