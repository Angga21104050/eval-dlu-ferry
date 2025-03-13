// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:flutter_svg/flutter_svg.dart';

// // import '../controllers/home_controller.dart';

// // class HomeView extends GetView<HomeController> {
// //   const HomeView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         decoration: BoxDecoration(color: Colors.white),

// //         child: Column(
// //           children: [
// //             Container(
// //               height: 500,
// //               padding: EdgeInsets.only(top: 50, left: 16, right: 16),
// //               alignment: Alignment.topRight,
// //               width: double.infinity,
// //               decoration: BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [
// //                     Colors.blue.shade900,
// //                     Color.fromARGB(255, 255, 255, 255),
// //                   ],
// //                   begin: Alignment.topCenter,
// //                   end: Alignment.bottomCenter,
// //                 ),
// //                 image: DecorationImage(
// //                   // mengambil gambar map-global dari assets
// //                   image: AssetImage('assets/img/map-global.png'),
// //                   fit: BoxFit.contain,
// //                   alignment: Alignment.topCenter,
// //                 ),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         'Selamat Malam',
// //                         style: TextStyle(color: Colors.white, fontSize: 16),
// //                       ),
// //                       Icon(Icons.notifications, color: Colors.white),
// //                     ],
// //                   ),
// //                   SizedBox(height: 4),
// //                   Text(
// //                     'JHON DOE',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 22,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),

// //             // BottomNavigationBar(
// //             //   items: [
// //             //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
// //             //     BottomNavigationBarItem(icon: Icon(Icons.receipt), label: ''),
// //             //     BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
// //             //     BottomNavigationBarItem(
// //             //       icon: Icon(Icons.account_circle),
// //             //       label: '',
// //             //     ),
// //             //   ],
// //             //   selectedItemColor: Colors.blue,
// //             //   unselectedItemColor: Colors.grey,
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

//   // Widget ticketInput(String title, String value, IconData icon) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 8),
//   //     child: Container(
//   //       padding: EdgeInsets.all(12),
//   //       decoration: BoxDecoration(
//   //         color: Colors.white,
//   //         borderRadius: BorderRadius.circular(8),
//   //         border: Border.all(color: Colors.grey.shade300),
//   //       ),
//   //       child: Row(
//   //         children: [
//   //           Icon(icon, color: Colors.blue),
//   //           SizedBox(width: 10),
//   //           Column(
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
//   //               Text(
//   //                 value,
//   //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//   //               ),
//   //             ],
//   //           ),
//   //           Spacer(),
//   //           if (title == 'Dari' || title == 'Ke')
//   //             Icon(Icons.swap_vert, color: Colors.grey),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// // }




// // app bar
// child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(top: 0),
//             child: Column(
//               children: [
//                 // container 1 AppBar
//                 Container(
//                   height: 150,
//                   decoration: BoxDecoration(
//                     // wana background transparan
//                     color: const Color.fromARGB(0, 255, 255, 255),
//                   ),
//                   // membuat stack untuk menumpuk widget yang lain di dalamnya
//                   child: Stack(
//                     children: [
//                       Transform.translate(
//                         offset: Offset(0, 50),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage('assets/img/map-global.png'),
//                               fit: BoxFit.contain,
//                               alignment: Alignment.topCenter,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               top: 50,
//                               left: 20,
//                               right: 20,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 150,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Selamat Malam',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Airlangga Maulana Anwar',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         maxLines: 1, // Batasi menjadi 1 baris
//                                         overflow:
//                                             TextOverflow
//                                                 .ellipsis, // Tambahkan titik "..." jika kepanjangan
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 // membungkus 2 icon
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 35,
//                                       width: 35,
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromARGB(
//                                           63,
//                                           255,
//                                           255,
//                                           255,
//                                         ),
//                                         borderRadius: BorderRadius.circular(35),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.notifications,
//                                             color: Colors.white,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Container(
//                                       height: 35,
//                                       width: 35,
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromARGB(
//                                           63,
//                                           255,
//                                           255,
//                                           255,
//                                         ),
//                                         borderRadius: BorderRadius.circular(35),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(Icons.info, color: Colors.white),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(width: 5),
//                                     Container(
//                                       height: 35,
//                                       width: 90,
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromARGB(
//                                           63,
//                                           255,
//                                           255,
//                                           255,
//                                         ),
//                                         borderRadius: BorderRadius.circular(35),
//                                       ),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Icon(
//                                             Icons.headset_mic,
//                                             color: Colors.white,
//                                           ),
//                                           SizedBox(width: 3),
//                                           Text(
//                                             'Bantuan',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 12,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // container 2 form ticket
//                 InputFormTicket(),
//               ],
//             ),
//           ),
//         ),