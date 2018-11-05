/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter_mvp/bean/contact.dart';
import 'package:flutter_mvp/mvp/contract.dart';
import 'package:flutter_mvp/repository/mock_contact_repository.dart';

class ContactPresenter implements Presenter {
  View _view;
  ContactRepository _repository;

  ContactPresenter(this._view) {
    _view.setPresenter(this);
  }

  @override
  init() {
    _repository = new MockContactRepository();
  }

  @override
  loadContacts() {
    assert(_view != null);
    _repository.fetch().then((contacts) {
      _view.onLoadContactsCompete(contacts);
    }).catchError((error) {
      print(error);
      _view.onLoadContactsError();
    });
  }
}
