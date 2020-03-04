import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String avatar;
  final String account;

  const Profile({
    @required this.name,
    @required this.avatar,
    @required this.account,
  });
}

const Profile me = Profile(
  name: "2018.02.03",
  avatar: "http://www.mimito.com.cn/uploadfile/201810/22/2414242968.jpg",
  account: "zhisheng8664"
);
