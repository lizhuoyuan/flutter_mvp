/*
 * author: Created by 李卓原 on 2018/11/5.
 * email: zhuoyuan93@gmail.com
 * mvp
 */

abstract class IView<T> {
  setPresenter(T presenter);
}

abstract class IPresenter {
  init();
}
