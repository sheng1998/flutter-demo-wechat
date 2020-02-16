import 'package:flutter/material.dart';

import '../constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart' show Conversation, mockConversations;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key, this.conversation})
      : assert(conversation != null),
      super(key : key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: Constants.DividerWidth,
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/default_nor_avatar.png',
            width: Constants.ContactAvatarSize,
            height: Constants.ContactAvatarSize,
          ),
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
            children: <Widget>[
              Text(conversation.updateAt, style: AppStyles.DesStyle),
            ],
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _ConversationItem(conversation: mockConversations[index],);
      },
      itemCount: mockConversations.length,
    );
  }
}