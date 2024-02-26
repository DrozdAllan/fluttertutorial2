import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertutorial2/logic/cubit/is_dark_theme.dart';
import 'package:fluttertutorial2/views/anim_1.dart';
import 'package:fluttertutorial2/views/blocs.dart';
import 'package:fluttertutorial2/views/camera.dart';
import 'package:fluttertutorial2/views/flutterfire.dart';
import 'package:fluttertutorial2/views/form_builder.dart';
import 'package:fluttertutorial2/views/geolocator.dart';
import 'package:fluttertutorial2/views/http_tuto.dart';
import 'package:fluttertutorial2/views/persistent_storage/persistent_storage.dart';
import 'package:fluttertutorial2/views/stateful_animations.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://allandrozd.com');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Flutter Tutorials 2'),
        actions: [
          AnimatedCrossFade(
              firstChild: const LightButtonIcon(),
              secondChild: const DarkButtonIcon(),
              crossFadeState: Theme.of(context).brightness == Brightness.dark
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
              sizeCurve: Curves.bounceOut),
          IconButton(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Flutter Tutorials 2',
                    applicationLegalese:
                        'This app is developed by Allan Drozd on Flutter 3.16.8',
                    children: [
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            'Visit Allan Drozd Website',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        onTap: () async {
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                      )
                    ]);
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: GridView.count(
        crossAxisCount:
            MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: 3,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 30.0,
        children: [
          ListTile(
            title: const Text('Stateful Animations'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StatefulAnimations(),
            )),
          ),
          ListTile(
            title: const Text('Persistent Storage'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PersistentStorage(),
            )),
          ),
          ListTile(
            title: const Text('Http Tuto'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HttpTuto(),
            )),
          ),
          ListTile(
            title: const Text('Form Builder'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FormBuilderTuto(),
            )),
          ),
          ListTile(
            title: const Text('Blocs'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Blocs(),
            )),
          ),
          ListTile(
            title: const Text('Flutterfire'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FlutterFire(),
            )),
          ),
          ListTile(
            title: const Text('Geolocator'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Geolocator(),
            )),
          ),
          ListTile(
            title: const Text('Camera'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Camera(),
            )),
          ),
          ListTile(
            title: const Text('Anim 1'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Anim1(),
            )),
          ),
          ListTile(title: const Text('GMaps ?'), onTap: () {}),
        ],
      ),
    );
  }
}

class LightButtonIcon extends StatelessWidget {
  const LightButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsDarkThemeCubit, bool>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<IsDarkThemeCubit>().swap();
          },
          icon: const Icon(Icons.motion_photos_paused_sharp),
        );
      },
    );
  }
}

class DarkButtonIcon extends StatelessWidget {
  const DarkButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsDarkThemeCubit, bool>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<IsDarkThemeCubit>().swap();
          },
          icon: const Icon(Icons.sunny),
        );
      },
    );
  }
}
