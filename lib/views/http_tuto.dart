import 'package:flutter/material.dart';
import 'package:fluttertutorial2/data/dataproviders/http_package_api.dart';

class HttpTuto extends StatelessWidget {
  const HttpTuto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http'),
      ),
      body: FutureBuilder(
          future: HttpPackageApi.getCall(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return snapshot.hasError
                    ? Text("Error: ${snapshot.error}")
                    : Column(
                        children: [
                          Text(snapshot.data!.name),
                          Text(snapshot.data!.description),
                          Text(snapshot.data!.latestVersion),
                          Text(snapshot.data!.publisher),
                        ],
                      );
            }
          }),
    );
  }
}
