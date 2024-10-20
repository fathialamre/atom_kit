import 'package:atom_kit/src/ui/placeholders/atom_text.dart';
import 'package:flutter/material.dart';

class AtomPage extends StatelessWidget {
  const AtomPage({super.key});

  const AtomPage.withAppBar({super.key});

  final String title = 'Atom Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: AtomText.titleLarge('ABCDEFGHIJKLMNOPQRSTUVWXYZ'),
      ),
    );
  }
}
