import 'package:flutter/material.dart';

import '../constants.dart' show AppColors;
import '../constants.dart' show Constants;

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
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  // 底部导航数据结构
  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    this._title = title,
    this._icon = icon,
    this._activeIcon = activeIcon,
    this.item = BottomNavigationBarItem(
      icon: Icon(icon, color: Color(AppColors.TabIconNormal),),
      activeIcon: Icon(activeIcon, color: Color(AppColors.TabIconActive),),
      title: Text(title, style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColors.TabIconNormal)
      ),),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

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
  }

  /* 定义下拉列表的数据结构 */
  _buildPopupMunuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(IconData(
          iconName,
          fontFamily: Constants.IconFontFamily,
        )),
        Container(width: 12.0),
        Text(title)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    /* 定义底部导航栏 */
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击了第 $index 个Tab');
      },
    );

    return Scaffold(

      /* 顶部状态栏 */
      appBar: AppBar(
        title: Text('微信'),
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
              print('点击的是 $selected');
            },
            color: Colors.pink,
          ),
          Container(width: 16.0,),
        ],
      ),
      body: Container(
        color: Colors.cyan
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}