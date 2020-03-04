import 'package:flutter/material.dart';

class AppColors {
  static const PrimaryColor = 0xffebebeb;
  static const BackgroundColor = 0xffededed; // 背景颜色
  static const AppBarColor = 0xff303030; // 顶部 bar 的背景颜色
  static const ActionIconColor = 0xff000000;
  static const ActionMenuBgColor = 0xff4c4c4c;
  static const CardBgColor = 0xffffffff;
  static const TabIconNormal = 0xff999999; // 底部 tab 默认图标和字体的颜色
  static const TabIconActive = 0xff46c11b; // 底部 tab 激活图标和字体的颜色
  static const AppBarPopupMenuColor = 0xffffffff; // 顶部右边加号下拉列表背景颜色
  static const TitleColor = 0xff353535; // 用户昵称字体颜色
  static const ConversationItemBg = 0xffffffff; // 每条消息列表的背景颜色
  static const DesTextColor = 0xff9e9e9e; // 最新一条消息描述的字体颜色
  static const DividerColor = 0xffd9d9d9; // 每个消息列表项的下边框颜色
  static const NotifyDotBg = 0xffff3e3e; // 消息条数的背景颜色
  static const NotifyDotText = 0xffffffff; // 消息条数的字体颜色
  static const ConversationMuteIcon = 0xffd8d8d8; // 勿扰图标的颜色
  static const DeviceInfoItemBg = 0xff5f5f5; // 其他设备登录区域背景颜色
  static const DeviceInfoItemText = 0xff606062; // 其他设备登录区域字体颜色
  static const DeviceInfoItemIcon = 0xff606062; // 其他设备登录区域图标颜色
  static const ContactGroupTitleBg = 0xffebebeb; // 分组标签背景颜色
  static const ContactGroupTitleText = 0xff888888; // 分组标签字体颜色
  static const IndexLetterBoxBg = Colors.black45;

  /* 我的页面 */
  static const HeaderCardBg = Colors.white; // 头部背景颜色
  static const HeaderCardTitleText = 0xff353535; // 头部昵称字体颜色
  static const HeaderCardDesText = 0xff7f7f7f; // 头部账号字体颜色
  static const ButtonDesText = 0xff8c8c8c; // 提示信息

  static const ButtonArrowColor = 0xffadadad;
  static const NewTagBg = 0xfffa5251;
  static const ChatBoxBg = 0xfff7f7f7;
  static const ChatBoxCursorColor = 0xff07c160;
}

class AppStyles {
  static const TitleStyle = TextStyle( // 用户昵称的样式
    fontSize: Constants.TitleTextSize,
    color: const Color(AppColors.TitleColor),
  );

  static const DesStyle = TextStyle( // 最新一条消息描述和时间的样式
    fontSize: Constants.DesTextSize,
    color: Color(AppColors.DesTextColor),
  );

  static const UnreadMsgCountDotStyle = TextStyle( // 未读消息条数字体样式
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );

  static const DeviceInfoItemTextStyle = TextStyle( // 其他设备登录区域字体样式
    fontSize: Constants.DesTextSize,
    color: Color(AppColors.DeviceInfoItemText),
  );

  static const GroupTitleItemTextStyle = TextStyle( // 分组标签字体样式
    fontSize: 14.0,
    color: Color(AppColors.ContactGroupTitleText),
  );

  static const IndexLetterBoxTextStyle =
      TextStyle(fontSize: 64.0, color: Colors.white);

  static const HeaderCardTitleTextStyle = TextStyle( // 我的页面昵称字体样式
      fontSize: 20.0,
      color: Color(AppColors.HeaderCardTitleText),
      fontWeight: FontWeight.bold);

  static const HeaderCardDesTextStyle = TextStyle(  // 我的页面账号字体样式
      fontSize: 14.0,
      color: Color(AppColors.HeaderCardDesText),
      fontWeight: FontWeight.normal);

  static const ButtonDesTextStyle = TextStyle( // 提示信息字体样式
      fontSize: 12.0,
      color: Color(AppColors.ButtonDesText),
      fontWeight: FontWeight.bold);

  static const NewTagTextStyle = TextStyle(
      fontSize: Constants.DesTextSize,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const ChatBoxTextStyle = TextStyle(
    fontSize: Constants.ContentTextSize,
    color: const Color(AppColors.TitleColor)
  );
}

class Routes {
  static const Home = "/";
  static const Conversation = "/conversation";
}

class Constants {
  static const IconFontFamily = "appIconFont"; // 字体图标的名称
  static const ActionIconSize = 20.0;
  static const ActionIconSizeLarge = 32.0;
  static const AvatarRadius = 4.0;
  static const ConversationAvatarSize = 48.0; // 用户头像的长宽
  static const DividerWidth = 1.0; // 每条消息列表的下边框宽度
  static const UnReadMagNotifyDotSize = 20.0; // 未读消息条数背景圆圈的大小（长宽）
  static const ConversationMuteIconSize = 18.0; // 勿扰图标的大小
  static const ContactAvatarSize = 36.0; // 通讯录图标大小
  static const TitleTextSize = 14.0; // 用户昵称的字号
  static const ContentTextSize = 20.0;
  static const DesTextSize = 12.0; // 最新一条消息描述的字号
  static const IndexBarWidth = 24.0; // 通讯录右边字母导航条的宽度
  static const IndexLetterBoxSize = 114.0;
  static const IndexLetterBoxRadius = 4.0;
  static const ChatBoxHeight = 48.0;

  static const String MENU_MARK_AS_UNREAD = 'MENU_MARK_AS_UNREAD';
  static const String MENU_MARK_AS_UNREAD_VALUE = '标为未读';
  static const String MENU_PIN_TO_TOP = 'MENU_PIN_TO_TOP';
  static const String MENU_PIN_TO_TOP_VALUE = '置顶聊天';
  static const String MENU_DELETE_CONVERSATION = 'MENU_DELETE_CONVERSATION';
  static const String MENU_DELETE_CONVERSATION_VALUE = '删除该聊天';
  static const String MENU_PIN_PA_TO_TOP = 'MENU_PIN_PA_TO_TOP';
  static const String MENU_PIN_PA_TO_TOP_VALUE = '置顶公众号';
  static const String MENU_UNSUBSCRIBE = 'MENU_UNSUBSCRIBE';
  static const String MENU_UNSUBSCRIBE_VALUE = '取消关注';
}
