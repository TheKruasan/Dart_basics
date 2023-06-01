import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  late InAppWebViewController _webViewController;
  // final InAppLocalhostServer _localhostServer = InAppLocalhostServer();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    // _localhostServer.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.replay_10)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.forward_10)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.refresh)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12.5, bottom: 12.5, left: 7),
                        child: Form(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              fillColor: Colors.black,
                              iconColor: Colors.black,
                              focusColor: Colors.black,
                              hoverColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            controller: _controller,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1000,
                child: InAppWebView(
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  initialOptions: options,
                  initialUrlRequest:
                      URLRequest(url: Uri.parse("http://inappwebview.dev/")),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loadUrl();
        },
      ),
    );
  }

  void _loadUrl() {
    _webViewController.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse("http://github.com"),
      ),
    );
  }
}
