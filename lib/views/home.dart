import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertutorial2/logic/cubit/is_dark_theme.dart';
import 'package:fluttertutorial2/views/pairwords.dart';
import 'package:fluttertutorial2/views/stateful_animations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                showAboutDialog(context: context, children: [
                  GestureDetector(
                    child: const Text(
                      'Visit Allan Drozd Website',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    ),
                    onTap: () async {
                      // TODO: check url_launcher package
                      // https://pub.dev/packages/url_launcher
                      // await launch(Home._url)
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
            title: const Text('StatefulAnimations'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StatefulAnimations(),
            )),
          ),
          ListTile(
            title: const Text('PairWords'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PairWords(),
            )),
          ),
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
