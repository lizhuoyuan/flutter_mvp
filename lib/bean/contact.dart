/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 * 通讯录实体类
 */

class Contact {
  final String name;

  final String email;

  Contact({this.name, this.email});
}

///数据仓库接口
abstract class ContactRepository {
  ///用于获取通讯录列表。
  Future<List<Contact>> fetch();
}
