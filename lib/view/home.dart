import 'package:finekube_machinetest/controllers/data_controller.dart';
import 'package:finekube_machinetest/controllers/data_fetch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataController controller = Get.put(DataController());
  final ScrollController _scrollController = ScrollController();


  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    controller.fetchDebts();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (isTop) {
          controller.pageNumber.value =
              (int.parse(controller.pageNumber.value) + 1).toString();
          // controller.fetchDebts();
          controller.fetchDebts();
        }
      }
    });
    super.initState();
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
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: const HomeCards(),
                  ),
                  Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.97,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('My Debts'),
                          Spacer(),
                          Text('See All')
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: GetBuilder<DataController>(
                          init: DataController(),
                          initState: (_) {
                            DataController().fetchDebts();
                          },
                          builder: (_) {
                            return SmartRefresher(
                                enablePullDown: true,
                                enablePullUp: true,
                                header: const WaterDropHeader(),
                                controller: _refreshController,
                                onRefresh: _onRefresh,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: _.data.length,
                                  itemBuilder: (context, index) {
                                    return _.data.value.isEmpty
                                        ? const ListTile(
                                            title: Text('No debts'),
                                          )
                                        : Obx(() => ListTile(
                                              leading: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  color: Colors.grey[300],
                                                ),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.network(
                                                  _.data.value[index]['Img'],
                                                  height: 50,
                                                  width: 50,
                                                ),
                                              ),
                                              title: Row(
                                                children: [
                                                  Text(controller.data
                                                      .value[index]['Name']),
                                                  const Spacer(),
                                                  Text(controller
                                                          .data.value[index]
                                                      ['Amount'], style: TextStyle(
                                                        color: index%2==0? Colors.green: Colors.red,
                                                      ),),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                      'until ${controller.data.value[index]['Until']}'),
                                                  const Spacer(),
                                                  Text(
                                                      'out of ${controller.data.value[index]['OutOfAmount']}'),
                                                ],
                                              ),
                                            ));
                                  },
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                    )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/home.png'),
                height: 30,
                width: 30,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/history.png'),
                height: 30,
                width: 30,
              ),
              label: 'History',
            ),
            const BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/images/articles.png'),
                height: 30,
                width: 30,
              ),
              label: 'Articles',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFDDF247),
                ),
                child: const Image(
                  image: AssetImage('assets/images/plus_2.png'),
                  height: 20,
                  width: 20,
                ),
              ),
              label: 'Articles',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCards extends StatelessWidget {
  const HomeCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF82D4B3),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                            right: 0,
                            child: Image.asset(
                              'assets/images/bottom_left_arrow.png',
                              height: 60,
                            )),
                        Positioned(
                            left: 0,
                            top: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Owe me',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$1250',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '2 debts',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFFB9275),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                            right: 0,
                            child: Image.asset(
                              'assets/images/top_right_arrow.png',
                              height: 60,
                            )),
                        Positioned(
                            left: 0,
                            top: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'I owe',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$1130',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '2 debts',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    )),
              ),
            ),
          ),
        ]),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.15,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(151, 247, 247, 247),
                      radius: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: Image.asset(
                          'assets/images/plus.png',
                          fit: BoxFit.cover,
                          height: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(151, 247, 247, 247),
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: Image.asset(
                      'assets/images/topright-arrow.png',
                      fit: BoxFit.cover,
                      height: 15,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(151, 247, 247, 247),
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: Image.asset(
                      'assets/images/bottomleft_arrow.png',
                      fit: BoxFit.cover,
                      height: 15,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(151, 247, 247, 247),
                  radius: 40,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: Image.asset(
                      'assets/images/grid.png',
                      fit: BoxFit.cover,
                      height: 15,
                    ),
                  ),
                ),
              ],
            )),
      ),
    ]);
  }
}
