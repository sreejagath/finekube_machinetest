import 'package:flutter/material.dart';

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
