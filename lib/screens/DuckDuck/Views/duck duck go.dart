import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:goverment_service_app/utils/utils.dart';
import 'package:goverment_service_app/utils/widgets/pop-up-menu_button/pop_up_menu_button.dart';

class DuckDuckPage extends StatefulWidget {
  const DuckDuckPage({super.key});

  @override
  State<DuckDuckPage> createState() => _DuckDuckPageState();
}

class _DuckDuckPageState extends State<DuckDuckPage> {
  InAppWebViewController? inAppWebViewController;

  String? group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Browser"),
        centerTitle: true,
        actions: [
          myPopUpButton(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: Uri.parse("https://duckduckgo.com/")));
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () async {
                Map<String, dynamic> item = {
                  "Name": "Duck Duck Go",
                  "Url": "https://duckduckgo.com/",
                };

                bookMarkList.add(item);
                print(bookMarkList);
              },
              icon: Icon(Icons.bookmark_add)),
          IconButton(
              onPressed: () async {
                if (await inAppWebViewController!.canGoBack()) {
                  inAppWebViewController?.goBack();
                }
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          IconButton(
              onPressed: () async {
                await inAppWebViewController?.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () async {
                if (await inAppWebViewController!.canGoForward()) {
                  inAppWebViewController?.goForward();
                }
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) =>
            (snapshot.data == ConnectivityResult.wifi ||
                    snapshot.data == ConnectivityResult.mobile)
                ? Center(
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: Uri.parse("https://duckduckgo.com/"),
                      ),
                      onLoadStart: (controller, uri) {
                        setState(() {
                          inAppWebViewController = controller;
                        });
                      },
                      onLoadStop: (controller, uri) {},
                    ),
                  )
                : Center(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Image(
                          image: AssetImage(
                              "lib/utils/Assets/Internet-Access-Error.png"),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
