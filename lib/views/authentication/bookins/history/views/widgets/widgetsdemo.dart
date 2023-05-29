import 'package:flutter/cupertino.dart';

import '../../../../../../constant/constans.dart';

class index1 extends StatelessWidget {
  const index1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 19),
                  child: Text(
                    'From',
                    style: TextStyle(fontSize: 20, color: kblue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 85, top: 20),
                  child: Text(
                    'To',
                    style: TextStyle(color: kblue, fontSize: 19),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 19),
                  child: Text(
                    'JFK',
                    style: TextStyle(fontSize: 15, color: kblue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 39),
                  child: Image.asset('assets/images/Group 291.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 108, top: 20),
                  child: Text(
                    'BTJ',
                    style: TextStyle(color: kblue, fontSize: 15),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 19),
                  child: Text(
                    'John F. Kennedy \nAirport',
                    style: TextStyle(fontSize: 15, color: kblue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 5),
                  child: Text(
                    'Abbotsford National \nAirport',
                    style: TextStyle(color: kblue, fontSize: 15),
                  ),
                )
              ],
            ),
          ]),
          height: 150,
          width: 400,
          decoration: BoxDecoration(
              color: kwhite,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey),
              ],
              borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
  }
}

class index2 extends StatelessWidget {
  const index2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/Rectangle 1877.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Row(
                        children: [
                          Text(
                            'Rich Hotels, Chennai',
                            style: TextStyle(fontSize: 21),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                              'assets/images/Icon material-location-on.png')
                        ],
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40
      ],
    );
  }
}

class index3 extends StatelessWidget {
  const index3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        ksizedbox40,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 127,
              width: 400,
              color: kwhite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/NoPath.png'),
                  ),
                  kwidth10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ksizedbox10,
                      Text(
                        'Tourist Place, Turkey',
                        style: TextStyle(fontSize: 21),
                      ),
                      Text(
                        'Date : 15/04/2023 to 16/04/2023',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Check in : 03:44PM Check Out 03:43 PM',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Total Person : 5 Members',
                        style: TextStyle(color: kblue),
                      ),
                      Text(
                        'Ac Rooms',
                        style: TextStyle(color: kblue),
                      ),
                      ksizedbox10
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
