import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdBody extends StatefulWidget {
  const ThirdBody({Key? key}) : super(key: key);

  @override
  State<ThirdBody> createState() => _ThirdBodyState();
}

class _ThirdBodyState extends State<ThirdBody> {
  String url = "https://vaibhavdlights.github.io/val-api/val-api.json";
  List? data;
  var isLoaded = false;
  @override
  void initState() {
    getJsonData();
    super.initState();
  }

  Future<String> getJsonData() async {
    // ignore: unused_local_variable
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
      isLoaded = true;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 210,
          color: const Color(0xff201414),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 560,
          child: Visibility(
            visible: isLoaded,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              itemCount: data == null ? 0 : data?.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 300,
                  child: GestureDetector(
                    onTap: () {
                      launchURL(data![index]['link']);
                    },
                    child: Card(
                      elevation: 6.0,
                      color: const Color(0xff181414),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 140,
                              child: Image.network(
                                data![index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              data![index]['date'].toString().toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white38, fontFamily: 'couture'),
                            ).pOnly(top: 10, left: 10, right: 10),
                            // const SizedBox(height: 8.0),
                            Text(
                              data![index]['title'].toString().toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontFamily: 'couture'),
                            ).pOnly(top: 10, left: 10, right: 10),
                            Text(
                              data![index]['desc'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.white70),
                            ).pOnly(left: 10, right: 10),
                            Row(children: [
                              TextButton(
                                      onPressed: () {
                                        launchURL(data![index]['link']);
                                      },
                                      child: const Text("LEARN MORE",
                                          style: TextStyle(
                                              color: Colors.white38,
                                              fontStyle: FontStyle.italic)))
                                  .pOnly(left: 160, right: 10),
                            ]),
                          ],
                        ),
                      ),
                    ).pOnly(top: 10, left: 5, right: 5),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}

launchURL(String url) async {
  // ignore: deprecated_member_use
  await launch(url, forceWebView: true, enableJavaScript: true);
}
