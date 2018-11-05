/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_mvp/bean/contact.dart';
import 'package:flutter_mvp/mvp/contract.dart';
import 'package:flutter_mvp/presenter/contact_presenter.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() {
    _ContactPageState view = new _ContactPageState();
    ContactPresenter presenter = new ContactPresenter(view);
    presenter.init();
    return view;
  }
}

class _ContactPageState extends State<ContactPage> implements View {
  List<Contact> list = [];
  ContactPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mvp_contacts'),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: list.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _presenter.loadContacts(),
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Contact contact = list[index];
    return ListTile(
      leading: CircleAvatar(
        child: Text(contact.name.substring(0, 1)),
      ),
      subtitle: Text(contact.email),
      title: Text(contact.name),
    );
  }

  ///更新UI
  @override
  void onLoadContactsCompete(List<Contact> contacts) {
    setState(() {
      list = contacts;
      print('contact size  ${list.length}');
    });
  }

  @override
  void onLoadContactsError() {
    print('error');
  }

  @override
  setPresenter(Presenter presenter) {
    _presenter = presenter;
  }
}
