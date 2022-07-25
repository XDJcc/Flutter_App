# XDJcc

 First Flutter project form XDJcc.

## 1.路由

1)界面跳转:

```dart
  Navigator.of(context).push("/detail",arguments:{'id',"界面跳转"})
```

2)替换路由的两种方式:

```dart
  Navigator.of(context).pushReplacementNamed("/detail",
    arguments: {"id": "replace替换路由切换页面 goods -> detail,goods销毁,detail代替该层级"});
  Navigator.pushReplacementNamed(context, '/detail',
    arguments: {"id": "replace替换路由切换页面 goods -> detail,goods销毁,detail代替该层级"});

  Navigator.of(context).pushNamed();
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed('/transmitTwo');

```

```dart
  Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context) =>  Home()), (route) => route == null );
```

  清空路由栈，跳转至指定界面

```dart
  Navigator.of(context).pushNamedAndRemoveUntil(’/screen4’, ModalRoute.withName(’/screen1’));
```

  指将制定的页面加入到路由中，然后将之前的路径移除知道制定的页面为止（将具有给定名称的路由推到导航器上，然后删除所有路径前面的路由直到’predicate’返回true为止。）
  这时候将销毁栈内除了screen4的页面，点击直接去栈内screen4，这时screen4会重新build

## 2.Toast

  File: ./Toast.dart
  use bot_toast.
  Center display by default ,you can set different position.For example 'top' or 'bottom'

> Example:
> Toast.toastShow(msg,{position});
  

  
