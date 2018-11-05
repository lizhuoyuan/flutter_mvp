/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter_mvp/bean/contact.dart';
import 'package:flutter_mvp/util/http_util.dart';

class MockContactRepository implements ContactRepository {
  @override
  Future<List<Contact>> fetch() async {
    var response = await HttpUtil().get('get_contacts');
    List contacts = response['data'];

    return contacts
        .map((contact) =>
            new Contact(name: contact['name'], email: contact['email']))
        .toList();
  }
}
