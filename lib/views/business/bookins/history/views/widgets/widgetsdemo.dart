import 'package:flutter/cupertino.dart';

import '../../../../../../constant/constans.dart';

class index1 extends StatelessWidget {
  const index1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TO',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    'CHE',
                    style: TextStyle(color: kblue, fontSize: 19),
                  ),
                  ksizedbox10,
                  Text(
                    'John F. Kennedy Airport',
                    style: TextStyle(fontSize: 15, color: kblue),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/Group 39716.png',
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'FROM',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    'DEL',
                    style: TextStyle(fontSize: 19, color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    'Abbotsford National Airport',
                    style: TextStyle(color: kblue, fontSize: 15),
                  ),
                ],
              ),
            ),
          ]),
          height: 150,
          width: 700,
          decoration: BoxDecoration(
              color: kwhite,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0.0, 0.75), blurRadius: 5, color: kgrey),
              ],
              borderRadius: BorderRadius.circular(5)),
        ),
        ksizedbox30,
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TO',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    'CHE',
                    style: TextStyle(color: kblue, fontSize: 19),
                  ),
                  ksizedbox10,
                  Text(
                    'John F. Kennedy Airport',
                    style: TextStyle(fontSize: 15, color: kblue),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/Group 39716.png',
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'FROM', 
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    'DEL',
                    style: TextStyle(fontSize: 19, color: kblue),
                  ),
                  ksizedbox10,
                  Text(
                    'Abbotsford National Airport',
                    style: TextStyle(color: kblue, fontSize: 15),
                  ),
                ],
              ),
            ),
          ]),
          height: 150,
          width: 700,
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
                  Image.asset('assets/images/Rectangle 1877.png'),
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
