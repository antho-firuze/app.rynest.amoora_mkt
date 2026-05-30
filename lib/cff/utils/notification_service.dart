// import 'package:flutter/material.dart';

// void loadSingletonPage(NavigatorState? navigatorState,
//     {required String targetPage, required ReceivedAction receivedAction}) {
//   // Avoid to open the notification details page over another details page already opened
//   // Navigate into pages, avoiding to open the notification details page over another details page already opened
//   navigatorState?.pushNamedAndRemoveUntil(targetPage,
//       (route) {
//         return (route.settings.name != targetPage) || route.isFirst;
//       },
//       arguments: receivedAction);
// }
