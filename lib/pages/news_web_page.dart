// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class ArticleWebView extends StatefulWidget {
//   static const routeName = '/article_web';

//   final String url;

//   ArticleWebView({Key? key, required this.url}) : super(key: key);

//   @override
//   State<ArticleWebView> createState() => _ArticleWebViewState();
// }

// class _ArticleWebViewState extends State<ArticleWebView> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News App'),
//       ),
//       body: WebViewWidget(
//         controller: controller,
//       ),
//     );
//   }
// }
