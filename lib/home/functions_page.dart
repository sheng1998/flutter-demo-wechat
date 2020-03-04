import 'package:flutter/material.dart';

import '../constants.dart' show AppStyles, AppColors;
import "../modal/me.dart" show me;
import './full_width_button.dart';

class _Header extends StatelessWidget {
  static const AVATAR_SIZE = 72.0;
  static const SEPARATOP_SIZE = 16.0;
  static const QR_CODE_PREV_SIZE = 25.0;

  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: AppColors.HeaderCardBg,
      padding: const EdgeInsets.symmetric(
        horizontal: SEPARATOP_SIZE,
        vertical: 10.0
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(
            me.avatar,
            width: AVATAR_SIZE,
            height: AVATAR_SIZE,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: SEPARATOP_SIZE, bottom: 5.0),
                  child: Text(
                    me.name,
                    style: AppStyles.HeaderCardTitleTextStyle,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: SEPARATOP_SIZE),
                  child: Text(
                    "微信号：" + me.account,
                    style: AppStyles.HeaderCardDesTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/ic_qrcode_preview_tiny.png",
            width: QR_CODE_PREV_SIZE,
            height: QR_CODE_PREV_SIZE,
          )
        ],
      ),
    );
  }
}

class FunctionsPage extends StatefulWidget {
  FunctionsPage({Key key}) : super(key: key);

  @override
  _FunctionsPageState createState() => _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0,),
            _Header(),
            SizedBox(height: 20.0,),
            FullWidthButton(
              onPressed: () {
                print("点击了钱包");
              },
              iconPath: "assets/images/ic_cards_wallet.png",
              title: "钱包",
            ),
            FullWidthButton(
              onPressed: () {
                print("点击了收藏");
              },
              iconPath: "assets/images/ic_collections.png",
              title: "收藏",
            ),
            FullWidthButton(
              onPressed: () {
                print("点击了相册");
              },
              iconPath: "assets/images/ic_album.png",
              title: "相册",
            ),
            FullWidthButton(
              onPressed: () {
                print("点击了卡包");
              },
              iconPath: "assets/images/ic_cards_wallet.png",
              title: "卡包",
            ),
            FullWidthButton(
              onPressed: () {
                print("点击了表情");
              },
              iconPath: "assets/images/ic_emotions.png",
              title: "表情",
            ),
            SizedBox(height: 20.0,),
            FullWidthButton(
              onPressed: () {
                print("点击了设置");
              },
              des: "账号未保护",
              iconPath: "assets/images/ic_settings.png",
              title: "设置",
            ),
          ],
        ),
      ),
    );
  }
}
