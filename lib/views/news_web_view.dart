import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  late String url;

  NewsWebView({super.key, required this.url});
  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  WebViewController controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: controller..loadRequest(Uri.parse(widget.url)),
      ),
    );
  }
}
