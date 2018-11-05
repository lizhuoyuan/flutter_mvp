/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 * 通讯录实体类
 */

class Contact {
  String name;
  String email;
  int id;

  Contact({this.id, this.name, this.email});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> Contact = new Map<String, dynamic>();
    Contact['id'] = this.id;
    Contact['name'] = this.name;
    Contact['email'] = this.email;
    return Contact;
  }
}

class Contacts {
  List<Contact> data;

  Contacts({this.data});

  Contacts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Contact>();
      json['data'].forEach((v) {
        data.add(new Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

///数据仓库接口
abstract class ContactRepository {
  ///用于获取通讯录列表。
  Future<Contacts> fetch();

  ///获取单一用户的信息
  Future<Contact> getContact();
}
