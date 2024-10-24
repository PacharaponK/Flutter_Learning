import 'package:flutter/material.dart';
import 'package:workshop01/src/services/webapi_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WebApiService().feed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
            child: FutureBuilder(
                future: WebApiService().feed(),
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return Text("Loading...");
                  }

                  final youtubeData = snapshot.data;

                  // Low Performance Way
                  // return Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       ...youtubeData!.map((e) => Text(e.title))
                  //     ],
                  //   ),
                  // );

                  // Standard Way
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                        itemCount: youtubeData!.length,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () => print("Clicked!!!"),
                            child: Card(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    youtubeData![index].title,
                                  ),
                                  Image.network(youtubeData![index].youtubeImage),
                                  Text(
                                    youtubeData![index].subtitle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                })));
  }
}
