// import 'package:flutter/material.dart';
//
// import './Category_Screen.dart';
// import './favorite_screen.dart';
//
// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }
//
// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('DeliMeals'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category_outlined),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               ),
//             ],
//           ),
//         ),
//         body:  TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen()
//           ],
//         ),
//       ),
//     );
//   }
// }
