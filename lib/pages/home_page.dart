import 'package:area_51/components/box.dart';
import 'package:area_51/components/button.dart';
import 'package:area_51/theme/theme_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Box(
          color: Theme.of(context).colorScheme.primary,
          child: ButtonBox(
            color: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Provider.of<ThemeProdiver>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
