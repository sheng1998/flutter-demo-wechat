import 'package:flutter/material.dart';

import '../constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart' show Conversation, Device, ConversationPageData;

class _ConversationItem extends StatelessWidget {
  _ConversationItem({Key key, this.conversation})
    : assert(conversation != null),
    super(key : key);

  final Conversation conversation;
  var tapPos;

  _showMenu(BuildContext context, Offset tapPos) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(
      tapPos.dx, tapPos.dy,
      overlay.size.width - tapPos.dx,
      overlay.size.height - tapPos.dy
    );

    showMenu<String>(
      context: context,
      position: position,
      items: <PopupMenuItem<String>>[
        PopupMenuItem(
          child: Text(Constants.MENU_MARK_AS_UNREAD_VALUE),
          value: Constants.MENU_MARK_AS_UNREAD,
        ),
        PopupMenuItem(
          child: Text(Constants.MENU_PIN_TO_TOP_VALUE),
          value: Constants.MENU_PIN_TO_TOP,
        ),
        PopupMenuItem(
          child: Text(Constants.MENU_DELETE_CONVERSATION_VALUE),
          value: Constants.MENU_DELETE_CONVERSATION,
        ),
      ]).then<String>((String selected) {
        switch (selected) {
          default:
            print('当前选中的是：$selected');
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    /* 根据图片的获取方式初始化头像组件 */
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }

    Widget avatarContainer; // 用户头像和角标的组合
    // 如果未读消息条数大于 0 就显示角标
    if (conversation.unreadMsgCount > 0) {
      /* 未读消息角标 */
      Widget unreadMsgCountText = Container(
        width: Constants.UnReadMagNotifyDotSize,
        height: Constants.UnReadMagNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.UnReadMagNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(conversation.unreadMsgCount.toString(), style: AppStyles.UnreadMsgCountDotStyle,),
      );

      /* 用户头像与消息条数角标组合 */
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    /* 右边区域 */
    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyles.DesStyle),
      Container(height: 10.0,)
    ];
    if (conversation.isMute) { // 如果设置了勿扰则添加勿扰图标
      _rightArea.add(
        Icon(IconData(
          0xe755,
          fontFamily: Constants.IconFontFamily,
        ),
        color: Color(AppColors.ConversationMuteIcon),
        size: Constants.ConversationMuteIconSize,
      ));
    } else {
       _rightArea.add(
        Icon(IconData(
          0xe755,
          fontFamily: Constants.IconFontFamily,
        ),
        color: Colors.transparent,
        size: Constants.ConversationMuteIconSize,
      ));
    }

    return Material(
      color: Color(AppColors.ConversationItemBg),
      child: InkWell(
        onTap: () {
          print("打开回话列表:${conversation.title}");
        },
        onTapDown: (TapDownDetails details) {
          tapPos = details.globalPosition;
        },
        onLongPress: () {
          print("打开回话框");
          _showMenu(context, tapPos);
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            // color: Color(AppColors.ConversationItemBg),
            border: Border(
              bottom: BorderSide(
                color: Color(AppColors.DividerColor),
                width: Constants.DividerWidth,
              )
            )
          ),
          child: Row(
            children: <Widget>[
              avatarContainer,
              Container(width: 10.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(conversation.title, style: AppStyles.TitleStyle),
                    Text(conversation.des, style: AppStyles.DesStyle),
                  ],
                )
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: _rightArea,
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* 顶部其他设备登录区域 */
class _DeviceInfoItem extends StatelessWidget {
  const _DeviceInfoItem({Key key, this.device : Device.WIN}) : super(key: key);

  final Device device;

  int get iconName {
    return device == Device.WIN ? 0xe6b3 : 0xe61c;
  }

  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: Color(AppColors.DividerColor)
          ),
        ),
        color: Color(AppColors.DeviceInfoItemBg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 16.0,),
          Icon(IconData(
            iconName,
            fontFamily: Constants.IconFontFamily,
          ), color: Color(AppColors.DeviceInfoItemIcon), size: 24.0 ,),
          SizedBox(width: 16.0,),
          Text(
            '$deviceName 微信已登录，手机通知已关闭。',
            style: AppStyles.DeviceInfoItemTextStyle,
          )
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  ConversationPage({Key key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final ConversationPageData data = ConversationPageData.mock();
  @override
  Widget build(BuildContext context) {
    var mockConversations = data.conversations;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (data.device != null) {
          // 需要显示登陆设备的登陆信息
          if (index == 0) {
            return _DeviceInfoItem(device: data.device);
          }
          return _ConversationItem(conversation: mockConversations[index - 1],);
        } else {
          // 不需要显示登陆设备的登陆信息
          return _ConversationItem(conversation: mockConversations[index],);
        }
      },
      itemCount: data.device != null ? mockConversations.length + 1 : mockConversations.length,
    );
  }
}