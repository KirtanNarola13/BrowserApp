import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:goverment_service_app/Provider/Connect_Provider.dart';
import 'package:goverment_service_app/utils/utils.dart';
import 'package:provider/provider.dart';

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
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        Future.delayed(
                            Duration(seconds: 0),
                            () => showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return (bookMarkList.isEmpty)
                                      ? Container(
                                          alignment: Alignment.center,
                                          child: Text("No any bookmark yet..."),
                                        )
                                      : Container(
                                          child: ListView.builder(
                                              itemCount: bookMarkList.length,
                                              itemBuilder: (context, index) =>
                                                  ListTile(
                                                    title: Text(
                                                        "${bookMarkList[index]['Name']}"),
                                                    subtitle: Text(
                                                        "${bookMarkList[index]['Url']}"),
                                                  )),
                                        );
                                }));
                      },
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.bookmark),
                          SizedBox(width: 20),
                          Text("All Bookmarks")
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        Future.delayed(
                          Duration(seconds: 0),
                          () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Search Engine"),
                              alignment: Alignment.center,
                              content: Container(
                                height: 200,
                                width: 400,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                            value: "g",
                                            groupValue:
                                                Provider.of<ConnectProvider>(
                                                        context)
                                                    .radio,
                                            onChanged: (val) {
                                              Provider.of<ConnectProvider>(
                                                      context,
                                                      listen: false)
                                                  .ChangeRadio(val!);

                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/', (route) => false);
                                              Navigator.of(context).pop;
                                            }),
                                        SizedBox(width: 20),
                                        Text(
                                          "Google",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: "a",
                                            groupValue:
                                                Provider.of<ConnectProvider>(
                                                        context)
                                                    .radio,
                                            onChanged: (val) {
                                              Provider.of<ConnectProvider>(
                                                      context,
                                                      listen: false)
                                                  .ChangeRadio(val!);
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      'YahooPage',
                                                      (route) => false);
                                              Navigator.of(context).pop;
                                            }),
                                        SizedBox(width: 20),
                                        Text(
                                          "Yahoo",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: "f",
                                            groupValue:
                                                Provider.of<ConnectProvider>(
                                                        context)
                                                    .radio,
                                            onChanged: (val) {
                                              Provider.of<ConnectProvider>(
                                                      context,
                                                      listen: false)
                                                  .ChangeRadio(val!);
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      'BingPage',
                                                      (route) => false);
                                              Navigator.of(context).pop;
                                            }),
                                        SizedBox(width: 20),
                                        Text(
                                          "Bing",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                            value: "o",
                                            groupValue:
                                                Provider.of<ConnectProvider>(
                                                        context)
                                                    .radio,
                                            onChanged: (val) {
                                              Provider.of<ConnectProvider>(
                                                      context,
                                                      listen: false)
                                                  .ChangeRadio(val!);
                                              Navigator.of(context).pop;
                                            }),
                                        SizedBox(width: 20),
                                        Text(
                                          "Duck Duck Go",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.screen_search_desktop_outlined),
                          SizedBox(width: 20),
                          Text("Search Engine")
                        ],
                      ),
                    ),
                  ])
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
                    child: Column(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("assets/dog.jpeg"),
                          ),
                        ),
                        Container(
                          child: Image(
                            image: AssetImage("assets/1.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
