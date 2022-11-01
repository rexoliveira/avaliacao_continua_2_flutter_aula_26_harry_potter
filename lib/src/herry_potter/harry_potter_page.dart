import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../utils/consts.dart';
import '../models/harry_potter.dart';
import 'harry_potter_controller.dart';
import 'harry_potter_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final harryPotterController =
      HerryPotterController(repository: HerryPotterRepository());
  late List<HarryPotter> harryPotter;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleSmall = Theme.of(context).textTheme.titleSmall;
    TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      backgroundColor: const Color(0xFF747474),
      appBar: AppBar(
        title: Text(Consts.titleBarText,
            style: Theme.of(context).textTheme.labelLarge),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.autorenew_rounded),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              
            );
          },
        ),
      ),
      body: FutureBuilder(
        future: harryPotterController.getHarryPotter(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${snapshot.hasError}",
                    style: titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/');
                    },
                    child: const Text(
                      'Voltar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Consts.notDataText, style: titleLarge),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/');
                    },
                    child: const Text(
                      'Voltar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              harryPotter = snapshot.data!;
              return Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.all(16.0),
                color: const Color(0xB5FFFFFF),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: "${harryPotter[index].image}",
                            fit: BoxFit.cover,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('image/icon.png');
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${harryPotter[index].name}",
                            style: titleMedium,
                          ),
                          Text(
                            "${harryPotter[index].house}",
                            style: titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
