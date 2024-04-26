// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebView extends StatefulWidget {
//   const WebView({super.key});

//   @override
//   State<WebView> createState() => _WebViewState();
// }

// class _WebViewState extends State<WebView> {
//   late WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.disabled);
//   }

//   @override
//   Widget build(BuildContext context) {
//     controller.loadRequest(Uri.parse('https://codeseasy.com'));
//     return SafeArea(child: WebViewWidget(controller: controller));
//   }
// }
