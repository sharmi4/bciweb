// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../../../constands/constands.dart';
// import 'holiday_home.dart';

// class Sucessful_screen extends StatelessWidget {
//   const Sucessful_screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFF9F8FD),
//         elevation: 0,
//         leading: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: Image.asset('assets/images/Icon awesome-arrow-right.png',)),
//         title: Text(
//           'Payment Completed',
//           style: TextStyle(
//               fontSize: 27.sp, fontWeight: FontWeight.w800, color: kblue),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/accept-icon.png'),
//             Text(
//               'Payment Successful',
//               style: TextStyle(
//                   color: kblue, fontSize: 28.sp, fontWeight: FontWeight.w700),
//             ),
//             ksizedbox10,
//             Text(
//               'Thank you! Your payment is complete',
//               style: TextStyle(
//                   fontSize: 22.sp, fontWeight: FontWeight.w600, color: kblue),
//             ),ksizedbox40,ksizedbox40,
            
//         InkWell(onTap: (){Get.to(Holiday_Home());},
//                 child: Container(
//                   width: 150.w,
//                   height: 45.h,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       4,
//                     ),
//                     gradient: const LinearGradient(
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: [
//                         Color(0xFFFF5C29),
//                         Color(0xFFFFCD38),
//                       ],
//                     ),
//                   ),
//                   child: Text(
//                     'Done',
//                     style: TextStyle(
//                         fontSize: 17.sp,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),  ],
//         ),
//       ),
//     );
//   }
// }
