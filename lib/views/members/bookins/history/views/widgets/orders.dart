import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../../../../constant/constans.dart';


class Orders extends StatelessWidget {
  const Orders({super.key, required this.bottleimg});
final String bottleimg;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 110,
        color: kwhite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    bottleimg,
                  ),
                  kwidth10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(




                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Red Wine',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          Text('Bare Foot Wine'),
                          Text('270 ml')
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        '₹ 750',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: kyellow),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
