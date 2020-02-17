import 'package:flutter/material.dart';

import '../constants.dart' show AppColors;

enum Device {
  WIN, MAC
}

class Conversation {
  const Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor: AppColors.TitleColor,
    this.des,
    @required this.updateAt,
    this.isMute : false,
    this.unreadMsgCount : 0,
    this.displayDot : false,
  }): assert(avatar != null),
      assert(title != null),
      assert(updateAt != null)
  ;

  final String avatar; // 用户头像 url
  final String title; // 用户昵称
  final int titleColor; // 用户昵称颜色
  final String des; // 用户最新一条消息的描述
  final String updateAt; // 最新接受的一条消息的时间
  final bool isMute; // 消息提醒方式(是否免提示)
  final int unreadMsgCount; // 用户未读消息条数
  final bool displayDot; // 用户未读消息是否显示点

  bool isAvatarFromNet() {
    if (
      this.avatar.indexOf('http:') == 0 || 
      this.avatar.indexOf('https:') == 0
    ) {
      return true;
    }
    return false;
  }
}

class ConversationPageData {
  const ConversationPageData({
    this.device,
    this.conversations
  });

  final Device device;
  final List<Conversation> conversations;

  static mock() {
    return ConversationPageData(device: Device.WIN, conversations: mockConversations);
  }

  static List<Conversation> mockConversations = [
    const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      des: '',
      updateAt: '19:56',
      unreadMsgCount: 0,
      displayDot: true
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      des: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      des: '25元现金助力开学季！',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'http://b-ssl.duitang.com/uploads/item/201610/16/20161016183333_5jurS.jpeg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'http://5b0988e595225.cdn.sohucs.com/q_70,c_zoom,w_640/images/20190202/f4570634b3aa48e385b93a1fd9505527.jpeg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      des: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'http://tupian.qqw21.com/article/UploadPic/2020-1/202011422344886664.jpg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'http://image.biaobaiju.com/uploads/20180802/01/1533144547-HjKwoGUqyr.jpg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'http://b.hiphotos.baidu.com/zhidao/pic/item/35a85edf8db1cb1388d7d104db54564e92584b6f.jpg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'http://www.17qq.com/img_qqtouxiang/34130221.jpeg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'http://www.17qq.com/img_qqtouxiang/74785670.jpeg',
      title: '汤姆丁',
      des: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'http://b-ssl.duitang.com/uploads/item/201812/08/2018120804202_GfFC5.thumb.700_0.jpeg',
      title: 'Tina Morgan',
      des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unreadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'http://www.17qq.com/img_qqtouxiang/59274841.jpeg',
      title: 'Lily',
      des: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'http://img.jk51.com/img_jk51/341216230.jpeg',
      title: '李安',
      des: '玩王者吗？',
      updateAt: '12:21',
      isMute: false,
      unreadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'http://img.pc841.com/2018/0620/20180620094609805.jpg',
      title: '庄安',
      des: '明天我要去上学了',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'http://img.duoziwang.com/2018/01/201949473115.jpg',
      title: '秦刘刚',
      des: '最近家里天气还好吗',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'http://b-ssl.duitang.com/uploads/item/201611/12/20161112141448_hVtFf.jpeg',
      title: '莉莉安',
      des: '不知道说啥好，去死吧',
      updateAt: '昨天',
      isMute: false,
      unreadMsgCount: 0,
    ),
  ];
}
