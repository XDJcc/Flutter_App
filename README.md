# testaaa

 First Flutter project form XDJcc.

## 1.路由

1)界面跳转:

  Navigator.of(context).push("/detail",arguments:{'id',"界面跳转"})

2)替换路由的两种方式:

  Navigator.of(context).pushReplacementNamed("/detail",
    arguments: {"id": "replace替换路由切换页面 goods -> detail,goods销毁,detail代替该层级"});
  Navigator.pushReplacementNamed(context, '/detail',
    arguments: {"id": "replace替换路由切换页面 goods -> detail,goods销毁,detail代替该层级"});

## 2.Toast

  File: ./Toast.dart
  use bot_toast.
  Center display by default ,you can set different position.For example 'top' or 'bottom'

> Example:
> Toast.toastShow(msg,{position});
  

  
