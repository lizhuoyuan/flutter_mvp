/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter_mvp/mvp/mvp.dart';

abstract class Presenter implements IPresenter {
  loadContacts();
  getContact();
}

abstract class View implements IView<Presenter> {
  void onLoadContactsCompete(contacts);
  void onLoadContactsError();

  void onLoadContact(contact);
}
