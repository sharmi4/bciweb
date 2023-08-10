// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../../../../../../constant/constans.dart';

// class Buswigit extends StatelessWidget {
//   const Buswigit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size=MediaQuery.of(context).size;
//     return    Container(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //  kwidth10,
//                   CircleAvatar(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Image.asset(
//                           'assets/images/bus-1.png',
//                           height: 30,
//                         ),
//                         Text('20 -Sept').text.green500.make()
//                       ],
//                     ),
//                     backgroundColor: Colors.green.withOpacity(0.2),
//                     radius: 45,
//                   ),
//                   Container(
//                     width: size.width * 0.18,
//                     height: size.height * 0.15,
//                     //   color: kblue,
//                     child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Status').text.gray500.semiBold.make(),
//                             Text('Conformed').text.gray500.semiBold.make(),
//                           ],
//                         ),   Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text('Chennai').text.semiBold.xl2.make(), Text('-').text.semiBold.xl2.make(),
//                             Text('Bangalore').text.semiBold.xl2.make(),
//                           ],
//                         ),
//                      Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('K.P.N Travels').text.gray500.semiBold.make(),
                           
//                           ],
//                         ), 
//                         Divider(height: 1,)  ,
//                            Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Rating:5/6').text.gray500.semiBold.make(),
//                             Text('Rebook').text.green400.semiBold.make(),
//                           ],
//                         ),     ],
//                     ),
//                   ),
//                   //    kwidth10
//                   kwidth5,
//                 ],
//               ),
//             ),
//             height: size.height * 0.17,
//             width: size.width * 0.35,
//             decoration: BoxDecoration(
//               color: kwhite,
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(255, 190, 190, 190)
//                       .withOpacity(0.5), // Shadow color
//                   spreadRadius: 1, // The spread radius of the shadow
//                   blurRadius: 5, // The blur radius of the shadow
//                   //  offset: Offset(0, 3), // The offset of the shadow
//                 ),
//               ],
//             ));
//   }
// }