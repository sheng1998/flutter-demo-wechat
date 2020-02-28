import 'package:flutter/material.dart';

import '../constants.dart' show Constants, AppColors, AppStyles;
import '../modal/contacts.dart' show Contact, ContactsPageData;

class _ContactItem extends StatelessWidget {

  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed,
  });

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http:') || this.avatar.startsWith('https:');
  }

  @override
  Widget build(BuildContext context) {

    /* 左边图标 */
    Widget _avatarIcon;
    if (_isAvatarFromNet) {
      _avatarIcon = Image.network(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    } else {
      _avatarIcon = Image.asset(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }

    // 列表项主体
    Widget _button = Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: const Color(AppColors.DividerColor)
          )
        )
      ),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(width: 10.0,),
          Text(title),
        ],
      ),
    );

    // 分组标签
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16.0, 3.8, 16.0, 3.8),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(
              this.groupTitle,
              style: AppStyles.GroupTitleItemTextStyle,
            ),
          ),
          _button,
        ],
      );
    } else {
      _itemBody = _button;
    }

    return _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

  const INDEX_BAR_WORDS = [
    '↑', "☆", "A", "B", "C", "D",
    "E", "F", "G", "H", "I", "J",
    "K", "L", "M", "N", "O", "P",
    "Q", "R", "S", "T", "U", "V",
    "W", "X", "Y", "Z"
  ];

class _ContactsPageState extends State<ContactsPage> {
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      onPressed: () {
        print('添加新的朋友');
      }
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      onPressed: () {
        print('群聊');
      }
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      onPressed: () {
        print('标签');
      }
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      onPressed: () {
        print('公众号');
      }
    ),
  ];

  @override
  void initState() { 
    super.initState();
    _contacts..addAll(data.contacts)..addAll(data.contacts)..addAll(data.contacts);

    // 排序
    _contacts.sort((Contact a, Contact b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(child: Text(word));
    }).toList();

    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index < _functionButtons.length) {
              return _functionButtons[index];
            }
            int _contactIndex = index - _functionButtons.length;
            bool _isGroupTitle = true;
            Contact _contact = _contacts[_contactIndex];
            if (_contactIndex >=1 && _contact.nameIndex == _contacts[_contactIndex -1].nameIndex) {
              _isGroupTitle = false;
            }
            return _ContactItem(
              avatar: _contact.avatar,
              title: _contact.name,
              groupTitle: _isGroupTitle ? _contact.nameIndex : null,
            );
          },
          itemCount: _contacts.length + _functionButtons.length,
        ),
        Positioned(
          width: Constants.IndexBarWidth,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: Container(
            // color: Colors.black26 ,
            child: GestureDetector(
              onVerticalDragDown: (DragDownDetails details) {
                print('onVerticalDragDown');
              },
              onVerticalDragEnd: (DragEndDetails details) {
                print('onVerticalDragEnd');
              },
              onVerticalDragCancel: () {
                print('onVerticalDragCancel');
              },
              child: Column(children: _letters,),
            )
          ),
        )
      ],
    );
  }
}