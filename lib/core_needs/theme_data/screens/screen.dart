import 'package:flutter/material.dart';
import 'package:task_app/core_needs/theme_data/screens/text_form_fields.dart';

import '../../variables/global_variables.dart';
import '../constants/size_constants.dart';
import '../theme.dart';
import 'card_screen.dart';
import 'drawer.dart';

void main() {
  logger.t("Trace log");

  logger.d("Debug log");

  logger.i("Info log");

  logger.w("Warning log");

  logger.e("Error log", error: 'Test Error');

  logger.f("What a fatal log", error:"Error param" , stackTrace: StackTrace.current);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    changeDimension();
  }

  void changeDimension() async {
    sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
    debugPrint("sizeConstants.height : ${sizeConstants.height}, sizeConstants.width : ${sizeConstants.width}");
    debugPrint("didChangeMetrics called");
    // await Future.delayed(const Duration(milliseconds: 300)).then((_) {
    //   sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
    //   debugPrint("sizeConstants.height : ${sizeConstants.height}, sizeConstants.width : ${sizeConstants.width}");
    //   debugPrint("didChangeMetrics called");
    //   MyFontSize.updateParams(height: sizeConstants.sH01,width: sizeConstants.sW01,);
    // });
  }

  @override
  Widget build(BuildContext context) {
    sizeConstants.setWidthAndHeight(MediaQuery.of(context).size);
    return MaterialApp(
      theme: MyThemeData().getBaseThemeData(isDarkMode: false),
      darkTheme: MyThemeData().getBaseThemeData(isDarkMode: true),
      home: const Home(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  // Method to update selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextTheme"),
      ),
      drawer: MyDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed for 5 items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "HeadLineLarge",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "HeadLineMedium",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "HeadLineSmall",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "TitleLarge",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "TitleMedium",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "TitleSmall",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "LabelLarge",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                "LabelMedium",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                "LabelSmall",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "BodyLarge",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "BodyMedium",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "BodySmall",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextFormFieldsForThemeCheck(),
                        ),
                      );
                    },
                    child: const Text(
                      "TextFormFields",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardScreenForThemeCheck(),
                        ),
                      );
                    },
                    child: const Text(
                      "CardScreen",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("OutlinedButton"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text('Search Screen'),
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("No"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Yes"),
                    ),
                  ],
                  title: Text("Title Widget"),
                  content: Text("Content Widget"),
                  icon: Icon(Icons.dangerous_rounded),
                );
              },
            );
          },
          child: const Text(
            "Show Alert Dialog",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  //color: Colors.red[100],
                  alignment: Alignment.center,
                  child: const Text("Bottom Sheet"),
                );
              },
            );
          },
          child: const Text(
            "Show Bottom Sheet",
          ),
        ),
      ],
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('Notifications Screen'),
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  "Snackbar Content Widget",
                  maxLines: 2,
                ),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              ),
            );
          },
          child: const Text(
            "Snackbar",
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile Screen'),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const CameraScreen(),
          //       ),
          //     );
          //   },
          //   child: const Text(
          //     "Camera",
          //   ),
          // ),
          // ElevatedButton(
          //   onPressed: () async {
          //     var file = await imagePickerService.selectVideo(source: ImageSource.camera);
          //     debugPrint("file.length() : ${file?.length()}");
          //     var compressedVideoFile1 = await videoCompressService.compressVideo(path: file?.path ?? "");
          //     debugPrint("----------------compressedVideoFile1 completed----------------");
          //     var compressedVideoFile2 = await videoCompressService.compressVideo(
          //       path: compressedVideoFile1?.path ?? "",
          //       frameRate: 30,
          //       videoQuality: VideoQuality.LowQuality,
          //     );
          //     var videoThumbnail1 = await videoThumbnailService.getFromMemory(path: compressedVideoFile1!.path!);
          //     var videoThumbnail2 = await videoThumbnailService.getFromMemory(path: compressedVideoFile2!.path!);
          //     MyVideoData myVideoData1 = MyVideoData(videoInfo: compressedVideoFile1, thumbnail: videoThumbnail1!);
          //     MyVideoData myVideoData2 = MyVideoData(videoInfo: compressedVideoFile2, thumbnail: videoThumbnail2!);
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => VideoListView(
          //           videoDetails: [myVideoData1, myVideoData2],
          //         ),
          //       ),
          //     );
          //     debugPrint("----------------compressedVideoFile2 completed----------------");
          //   },
          //   child: const Text(
          //     "Video Compress",
          //   ),
          // ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Screen'),
    );
  }
}
