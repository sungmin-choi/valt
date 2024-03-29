import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valt/screens/dibs_page.dart';
import 'package:valt/screens/edit_password.dart';
import 'package:valt/screens/edit_profile.dart';
import 'package:valt/screens/home.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:valt/screens/my_page.dart';
import 'package:valt/screens/search_page.dart';
import 'package:valt/service/network_handler/deviceId.dart';
import 'package:valt/service/network_handler/network_handler.dart';

import 'controller/product_controller.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: 'd1ba24420a7871c373e202e5f09a8a70',
  );
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const MyApp(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/edit_password', page: () => const EditPasswordPage()),
        GetPage(name: '/edit_profile', page: () => const EditProfile()),
        GetPage(name: '/mypage', page: () => const MyPage())
      ],
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProductController productController = Get.put(ProductController());
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    const SearchPage(),
    const DibsPage(),
    const MyPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _storeDeviceId();
  }

  Future<void> _storeDeviceId() async {
    var deviceId = await getDeviceUniqueId();

    NetWorkHandler.storeDeviceId(deviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색/카테고리',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: '찜',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: '마이',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
