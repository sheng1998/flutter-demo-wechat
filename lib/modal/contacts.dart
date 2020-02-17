import 'package:flutter/material.dart';

class Contact {
  const Contact({
    @required this.avatar,
    @required this.name,
    @required this.nameIndex,
  });

  final String avatar;
  final String name;
  final String nameIndex;
}

class ContactsPageData {
  final List<Contact> contacts = [
    const Contact(
      avatar: 'http://www.17qq.com/img_qqtouxiang/79764888.jpeg',
      name: 'Maurice Sutton',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'http://i16.yd166.com/file/img/2w782300185u2651643715t26.jpg',
      name: 'Jerry',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'http://b-ssl.duitang.com/uploads/item/201611/12/20161112220454_wVruG.jpeg',
      name: 'Dangdang',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3081151730,4195482971&fm=11&gp=0.jpg',
      name: 'Teddy',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2959245629,1408325627&fm=26&gp=0.jpg',
      name: 'Steave',
      nameIndex: 'S',
    ),
    const Contact(
      avatar: 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=380331000,2265267153&fm=11&gp=0.jpg',
      name: 'Vivian',
      nameIndex: 'V',
    ),
    const Contact(
      avatar: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3670354489,668084089&fm=26&gp=0.jpg',
      name: 'Mary',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2611053130,375296455&fm=26&gp=0.jpg',
      name: 'David',
      nameIndex: 'D',
    ),
    const Contact(
      avatar: 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3786835588,288987526&fm=26&gp=0.jpg',
      name: 'Bob',
      nameIndex: 'B',
    ),
    const Contact(
      avatar: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3587672045,3403148211&fm=26&gp=0.jpg',
      name: 'Jeff Green',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1328933029,3444038791&fm=11&gp=0.jpg',
      name: 'Adam',
      nameIndex: 'A',
    ),
    const Contact(
      avatar: 'http://www.520touxiang.com/uploads/allimg/2018122414/d02znddqb42.jpg',
      name: 'Michel',
      nameIndex: 'M',
    ),
    const Contact(
      avatar: 'https://pic.feizl.com/upload/allimg/170721/qdvw0rdsytr072106.jpg',
      name: 'Green',
      nameIndex: 'G',
    ),
    const Contact(
      avatar: 'http://www.ghost64.com/qqtupian/zixunImg/local/2017/05/05/14939699511761.jpg',
      name: 'Jack Ma',
      nameIndex: 'J',
    ),
    const Contact(
      avatar: 'http://b-ssl.duitang.com/uploads/item/201412/12/20141212182012_ZUhKj.jpeg',
      name: 'Tom',
      nameIndex: 'T',
    ),
    const Contact(
      avatar: 'http://pic.9ht.com/up/2018-8/2018082016514567743.jpg',
      name: '张伟',
      nameIndex: 'Z',
    ),
    const Contact(
      avatar: 'https://images.liqucn.com/img/h23/h03/img_localize_f39a4b1baa9855d68a29b9d012e32996_400x400.png',
      name: '张益达',
      nameIndex: 'Z',
    ),
  ];

  static ContactsPageData mock() {
    return ContactsPageData();
  }
}
