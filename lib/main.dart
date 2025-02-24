import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newart/firebase_options.dart';
import 'package:newart/src/core/config/config.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/core/theme/theme_data.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:newart/src/features/home/presentation/getX/home_binding.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Plugin must be initialized before using
  requestStoragePermission();

  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  FirebaseAuth.instance.setLanguageCode('en');
  FirebaseAuth.instance.setLanguageCode('ar');
  await initializeDateFormatting('ar', null);

  // await initializeDateFormatting('en', null);
  // Example for Arabic
  // ignore: deprecated_member_use
  String deviceLocale = window.locale.toString(); // e.g., "en_US"
  await initializeDateFormatting(deviceLocale.split('_').first, null);

  // await initializeDateFormatting('ar', null);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    await DependencyInjection.init();
    runApp(const NewArtApp());
  });
}

class NewArtApp extends StatelessWidget {
  const NewArtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      theme: AppThemData.lightThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routesPage,
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      // home: PaymentSheet(),
      // home: DownloadScreen(),
    );
  }
}

//copy texxt
class CopyTextExample extends StatelessWidget {
  const CopyTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Copy to Clipboard Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: 'Hello, World!'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Text copied to clipboard')),
            );
          },
          child: Text('Copy Text'),
        ),
      ),
    );
  }
}

// class DownloadScreen extends StatelessWidget {
//   final DownloadController controller = Get.put(DownloadController());

//   DownloadScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Download File with GetX")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Progress Bar
//             Obx(() => LinearProgressIndicator(
//                   value: controller.progress.value / 100,
//                   backgroundColor: Colors.grey[200],
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                 )),
//             SizedBox(height: 16),

//             // Download Status
//             Obx(() => Text(
//                   "Download Progress: ${controller.progress.value}%",
//                   style: TextStyle(fontSize: 16),
//                 )),

//             SizedBox(height: 16),

//             // Download Button
//             ElevatedButton(
//               onPressed: () {
//                 controller.downloadFile(
//                   "https://github.com/mediaelement/mediaelement-files/blob/master/big_buck_bunny.mp4?raw=true",
//                   "big_buck_bunny.mp4",
//                 );
//               },
//               child: Text("Download File"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DownloadScreen extends StatefulWidget {
//   const DownloadScreen({super.key});

//   @override
//   State<DownloadScreen> createState() => _DownloadScreenState();
// }

// class _DownloadScreenState extends State<DownloadScreen> {
//   final DownloadController controller = Get.put(DownloadController());
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Download File with GetX")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Progress Bar
//             Obx(() => LinearProgressIndicator(
//                   value: controller.progress.value / 100,
//                   backgroundColor: Colors.grey[200],
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                 )),
//             SizedBox(height: 16),

//             // Download Status
//             Obx(() => Text(
//                   "Download Progress: ${controller.progress.value}%",
//                   style: TextStyle(fontSize: 16),
//                 )),

//             SizedBox(height: 16),

//             // Download Button
//             ElevatedButton(
//               onPressed: () {
//                 controller.downloadFile(
//                   "https://github.com/mediaelement/mediaelement-files/blob/master/big_buck_bunny.mp4?raw=true",
//                   // "big_buck_bunny.mp4",
//                 );
//               },
//               child: Text("Download File"),
//             ),

//             SizedBox(height: 16),

//             // Open File Button
//             Obx(() {
//               // Only show the button if the download is complete
//               if (controller.status.value == DownloadTaskStatus.complete) {
//                 return ElevatedButton(
//                   onPressed: () async {
//                     // Open the downloaded file
//                     await controller.openDownloadedFile();
//                   },
//                   child: Text("Open File"),
//                 );
//               } else {
//                 return SizedBox.shrink();
//               }
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
