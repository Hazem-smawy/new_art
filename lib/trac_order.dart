// import 'package:flutter/material.dart';

// class TrackDeliveryWidget extends StatelessWidget {
//   final List<Order> orders;

//   const TrackDeliveryWidget({super.key, required this.orders});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Track Delivery"),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView.builder(
//         itemCount: orders.length,
//         itemBuilder: (context, index) {
//           return OrderTimelineCard(order: orders[index]);
//         },
//       ),
//     );
//   }
// }

// class OrderTimelineCard extends StatelessWidget {
//   final Order order;

//   const OrderTimelineCard({super.key, required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Order: ${order.orderName}",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal,
//               ),
//             ),
//             SizedBox(height: 15),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: List.generate(order.statuses.length, (index) {
//                   final status = order.statuses[index];
//                   return Row(
//                     children: [
//                       TimelineStep(
//                         label: status.name,
//                         date: status.date,
//                         isCompleted: status.isCompleted,
//                         color: status.color,
//                         icon: status.icon,
//                       ),
//                       if (index <
//                           order.statuses.length - 1) // Add line between steps
//                         Container(
//                           width: 40,
//                           height: 2,
//                           color: Colors.grey[400],
//                         ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TimelineStep extends StatelessWidget {
//   final String label;
//   final String date;
//   final bool isCompleted;
//   final Color color;
//   final IconData icon;

//   const TimelineStep({
//     super.key,
//     required this.label,
//     required this.date,
//     required this.isCompleted,
//     required this.color,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 100, // Ensure enough width for each step
//       child: Column(
//         children: [
//           CircleAvatar(
//             backgroundColor: isCompleted ? color : Colors.grey[300],
//             radius: 20,
//             child: Icon(
//               icon,
//               color: isCompleted ? Colors.white : Colors.grey,
//               size: 20,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: isCompleted ? Colors.black87 : Colors.grey,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 5),
//           Text(
//             date,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Order {
//   final String orderName;
//   final List<OrderStatus> statuses;

//   Order({required this.orderName, required this.statuses});
// }

// class OrderStatus {
//   final String name;
//   final String date;
//   final bool isCompleted;
//   final Color color;
//   final IconData icon;

//   OrderStatus({
//     required this.name,
//     required this.date,
//     required this.isCompleted,
//     required this.color,
//     required this.icon,
//   });
// }
