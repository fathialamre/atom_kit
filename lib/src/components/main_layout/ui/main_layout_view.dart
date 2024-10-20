import 'package:flutter/material.dart';

class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key, required this.pages, required this.items});

  final List<Widget> pages;
  final List<NavigationDestination> items;

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int currentPage = 0;

  getCurrentPage() {
    return widget.pages[currentPage];
  }

  changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentPage(),
      bottomNavigationBar: NavigationBar(
        destinations: widget.items,
        selectedIndex: currentPage,
        onDestinationSelected: changePage,
      ),

      // items: widget.items,
      // currentIndex: currentPage,
      // onTap: changePage,
    );
  }
}
