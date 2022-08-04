import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFFE2EFF3),
          Color(0xFF99CDC6),
        ], stops: [
          0.0,
          1.0
        ], tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () {},
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(children: [
                    
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF82D4B3)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: const Color(0xFFFB9275)
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/home.png'),
                height: 30,
                width: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/history.png'),
                height: 30,
                width: 30,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/articles.png'),
                height: 30,
                width: 30,
              ),
              label: 'Articles',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/articles.png'),
                height: 30,
                width: 30,
              ),
              label: 'Articles',
            ),
          ],
        ),
      ),
    );
  }
}
