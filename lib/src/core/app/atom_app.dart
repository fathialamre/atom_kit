import 'package:atom_kit/atom_kit.dart';
import 'package:flutter/material.dart';

class AtomApp {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AtomCache.init();
  }
}
