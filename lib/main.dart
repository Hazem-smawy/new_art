import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_art/record.dart';
import 'package:new_art/src/core/config/config.dart';
import 'package:new_art/src/core/routes/app_pages.dart';
import 'package:new_art/src/core/theme/theme_data.dart';
import 'package:new_art/src/features/audio_player/presentation/pages/pages.dart';
import 'package:new_art/src/features/auth/presentation/pages/verify_page.dart';
import 'package:new_art/src/features/order/presentation/pages/track_order_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('ar', null);
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
      // home: VerifyEmailPage(),
      // home: AudioRecorderView(),
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
