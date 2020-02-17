import 'package:flutter/material.dart';

import '../constants.dart' show AppColors;
import '../constants.dart' show Constants;

import './conversation_page.dart';
import './contacts_page.dart';

// 枚举下拉列表的值
enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP
}

// 底部导航数据结构
class NavigationIconView {
  final BottomNavigationBarItem item;

  // 底部导航数据结构
  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    this.item = BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: Text(title, style: TextStyle(
        fontSize: 14.0
      ),),
      backgroundColor: Colors.white,
    );
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController; // 页数 0-4
  int _currentIndex = 0; // 导航页数 0-4
  List<NavigationIconView> _navigationViews; // 底部导航栏
  List<Widget> _pages; // 四个页面

  void initState() {
    super.initState();

    /* 初始化底部导航 */
    _navigationViews = [

      /* 微信 */
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),

      /* 通讯录 */
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
      ),

      /* 发现 */
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        ),
      ),

      /* 我 */
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
    
    /* 初始化四个页面 */
    _pageController = PageController(initialPage: _currentIndex);

    /* 初始化每个页面 */
    _pages = [
      ConversationPage(),
      ContactsPage(),
      Container(color: Colors.yellow),
      Container(color: Colors.cyan),
    ];
  }

  /* 定义下拉列表的数据结构 */
  _buildPopupMunuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
          iconName,
          fontFamily: Constants.IconFontFamily,
        ), size: 22.0, color: const Color(AppColors.AppBarPopupMenuColor),),
        Container(width: 12.0),
        Text(title, style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor),),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    /* 定义底部导航栏 */
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;

          _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
        // print('点击了底部导航的第 $index 个Tab');
      },
      // backgroundColor: Colors.cyan,
    );

    return Scaffold(

      /* 顶部状态栏 */
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0, // 去除阴影
        actions: <Widget>[ // 顶部右边两个按钮
          IconButton( // 搜索功能
            icon: Icon(IconData(
              0xe65e,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0,), 
            onPressed: () {}
          ),
          Container(width: 16.0,),

          /* 顶部右边加号相关功能 */
          PopupMenuButton( // 下拉列表
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e, '发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe638, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe61b, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe63d, '帮助与反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon:  Icon(IconData(
              0xe60e,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0,),
            onSelected: (ActionItems selected) {
              print('点击了下拉列表的： $selected');
            },
            color: Color(AppColors.AppBarColor),
            // color: Colors.cyan,
          ),
          Container(width: 16.0,),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller:  _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
          // print('当前是第 $index 页');
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}