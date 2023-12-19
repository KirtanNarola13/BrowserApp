import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Connect_Provider.dart';
import '../../utils.dart';

PopupMenuButton myPopUpButton() {
  return PopupMenuButton(
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
                                      itemBuilder: (context, index) => ListTile(
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
                        height: 300,
                        width: 400,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: "g",
                                    groupValue:
                                        Provider.of<ConnectProvider>(context)
                                            .radio,
                                    onChanged: (val) {
                                      Provider.of<ConnectProvider>(context,
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
                                        Provider.of<ConnectProvider>(context)
                                            .radio,
                                    onChanged: (val) {
                                      Provider.of<ConnectProvider>(context,
                                              listen: false)
                                          .ChangeRadio(val!);

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
                                        Provider.of<ConnectProvider>(context)
                                            .radio,
                                    onChanged: (val) {
                                      Provider.of<ConnectProvider>(context,
                                              listen: false)
                                          .ChangeRadio(val!);

                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              'BingPage', (route) => false);
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
                                        Provider.of<ConnectProvider>(context)
                                            .radio,
                                    onChanged: (val) {
                                      Provider.of<ConnectProvider>(context,
                                              listen: false)
                                          .ChangeRadio(val!);
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              'DuckDuckPage', (route) => false);
                                      Navigator.of(context).pop;
                                    }),
                                SizedBox(width: 20),
                                Text(
                                  "Duck Duck Go",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "b",
                                    groupValue:
                                        Provider.of<ConnectProvider>(context)
                                            .radio,
                                    onChanged: (val) {
                                      Provider.of<ConnectProvider>(context,
                                              listen: false)
                                          .ChangeRadio(val!);

                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              'Brave', (route) => false);
                                      Navigator.of(context).pop;
                                    }),
                                SizedBox(width: 20),
                                Text(
                                  "Brave",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
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
          ]);
}
