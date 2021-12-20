import 'package:flutter/material.dart';

class DummyHomePage extends StatefulWidget {
  const DummyHomePage({Key? key}) : super(key: key);

  @override
  _DummyHomePageState createState() => _DummyHomePageState();
}

class _DummyHomePageState extends State<DummyHomePage> {
  int _selectedPage = 0;
  late PageController _pageController;

  void _changePage(int page) {
    setState(() {
      _selectedPage = page;
      _pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تب بار سفارشی'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    name: 'تب اول',
                    pageNumber: 0,
                    selectedPage: _selectedPage,
                    onTap: () => _changePage(0),
                  ),
                  TabButton(
                    name: 'تب دوم',
                    pageNumber: 1,
                    selectedPage: _selectedPage,
                    onTap: () => _changePage(1),
                  ),
                  TabButton(
                    name: 'تب سوم',
                    pageNumber: 2,
                    selectedPage: _selectedPage,
                    onTap: () => _changePage(2),
                  ),
                ],
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                children: const [
                  TabPage(txt: 'صفحه اول'),
                  TabPage(txt: 'صفحه دوم'),
                  TabPage(txt: 'صفحه سوم'),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String name;
  final int selectedPage;
  final int pageNumber;
  final VoidCallback onTap;
  const TabButton(
      {Key? key,
      required this.name,
      required this.selectedPage,
      required this.pageNumber,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        padding: EdgeInsets.symmetric(
            vertical: 6, horizontal: selectedPage == pageNumber ? 24 : 8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            color:
                selectedPage == pageNumber ? Colors.white : Colors.blueAccent,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          name,
          style: TextStyle(
              color: selectedPage == pageNumber ? Colors.blue : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final String txt;
  const TabPage({Key? key, required this.txt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        txt,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
