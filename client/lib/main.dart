import 'package:client/api/firebase_api.dart';
import 'package:client/firebase_options.dart';
import 'package:client/ui/contact_us_screen.dart';
import 'package:client/ui/landing_page.dart';
import 'package:client/ui/sos/helper_accept_sos_screen.dart';
import 'package:client/ui/sos/helper_notification_screen.dart';
import 'package:client/ui/sos_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:client/models/quiz_category_model.dart';
import 'package:client/ui/complete_quiz_screen.dart';
import 'package:client/ui/frame_screen.dart';
import 'package:client/ui/home_screen.dart';
import 'package:client/ui/leader_board_screen.dart';
import 'package:client/ui/learning_firstaid_screen.dart';
import 'package:client/ui/quiz_game_screen.dart';
import 'package:client/ui/update_certificate_screen.dart';
import 'package:client/ui/update_screen.dart';
import 'package:client/ui/upload_image.dart';
import 'package:client/view_model/auth_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:client/ui/notification_screen.dart';

import 'ui/greeting_screen.dart';

final NavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAPI().initNotification(); // Add this line
  FirebaseAPI().initNotification(); // Add this line
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> certificatesTitles = ["CPR", "First Aid", "AED", "CPR", "First Aid", "AED"];
    final List<String> certificatesImageUrls = [
      "https://blogs.bournemouth.ac.uk/research/files/2014/07/Certificate-of-Merit2.jpg",
      "https://blogs.bournemouth.ac.uk/research/files/2014/07/Certificate-of-Merit2.jpg",
          "https://blogs.bournemouth.ac.uk/research/files/2014/07/Certificate-of-Merit2.jpg",
      "https://blogs.bournemouth.ac.uk/research/files/2014/07/Certificate-of-Merit2.jpg",
      "https://blogs.bournemouth.ac.uk/research/files/2014/07/Certificate-of-Merit2.jpg",
      "https://blogs.bournemouth.ac.uk/research/files/2014/07/Certificate-of-Merit2.jpg",
    ];
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: GetMaterialApp(
        title: 'FirstAid App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
            }
          ),
        ),
        home: HelperNotificationScreen(
          imageUrl: "https://i.pinimg.com/originals/4a/2c/65/4a2c657041ac5b0e910a2697ca21e914.jpg",
          victimLocation: const LatLng(37.33429383, -122.06600055),
        ),
        routes: {
          '/home': (context) => const LandingPage(),
          NotificationScreen.routeName: (context) => const NotificationScreen(),
          // '/main': (context) => const MainScreen(),
          // '/frame': (context) => const FrameScreen(),
          // '/quiz': (context) => const QuizGameScreen(),
          // '/complete': (context) => const CompleteQuizScreen(),
          // '/leaderboard': (context) => const LeaderBoardScreen(),
          // '/learning': (context) => const LearningFirstAidScreen(),
        }
        // home: MainScreen(),
      )
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
