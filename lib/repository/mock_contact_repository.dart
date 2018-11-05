/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter_mvp/bean/contact.dart';
import 'package:flutter_mvp/util/http_util.dart';

class MockContactRepository implements ContactRepository {
  @override
  Future<Contacts> fetch() async {
    var response = await HttpUtil().get('get_contacts');
    return Contacts.fromJson(response);
  }

  @override
  Future<Contact> getContact() async {
    var response = await HttpUtil().get('get_contact');
    return Contact.fromJson(response);
  }
}
