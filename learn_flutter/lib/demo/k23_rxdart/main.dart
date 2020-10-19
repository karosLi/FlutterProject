import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KKHomePage(),
    );
  }
}

class KKHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxDart"),
      ),
      body: KKHomeContent()
    );
  }
}

class KKHomeContent extends StatefulWidget {
  @override
  _KKHomeContentState createState() => _KKHomeContentState();
}

class _KKHomeContentState extends State<KKHomeContent> {

  @override
  void initState() {
    super.initState();

    {
      // 迭代
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.listen(print);// 1 2 3 4 5
    }

    {
      // Future
//      Stream stream = Stream.fromFuture(Future<int>.delayed(Duration(seconds: 1), () {
//        return 88;
//      }));
//      stream.listen(print);// 88
    }

    {
      // 转换
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.map((event) => event * 2).listen(print);// 2 4 6 8 10
    }

    {
      // 条件
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.where((event) => event % 2 == 0).listen(print);// 2 4
    }

    {
      // 跳过
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      // 跳过前2个
//      stream.skip(2).listen(print);// 3 4 5
    }

    {
      // 指定事件发生次数
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      // 执行2次
//      stream.take(2).listen(print);// 1 2
    }

    {
      // 去掉冗余
//      Stream stream = Stream.fromIterable([1, 1, 2, 2, 2, 3, 4, 4, 5]);
//      // stream 提供的方法
//      stream.distinct().listen(print);// 1 2 3 4 5

      // rxdart 提供的方法
//      stream.distinctUnique().listen(print);// 1 2 3 4 5
    }

    {
      // 指定开始事件
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.startWith(10).listen(print);// 10 1 2 3 4 5
    }

    {
      // 间隔输出
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.interval(Duration(seconds: 3)).listen(print);
    }

    {
      // 扩展流
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]).expand((element) => [element, element * 2]);
//      stream.listen(print);// 1 2 2 4 3 6 4 8 5 10
    }

    {
      // 扁平转换 - flatMap 函数必须返回的是一个 stream
//      Stream stream = Stream.fromIterable([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
//      // 把数组的数组铺平
//      stream.flatMap((value) {
////        print("${value.runtimeType} $value");
//        return Stream.fromIterable(value);
//      }).listen(print);// 1 2 3 4 5 6 7 8 9 ？ 1 2 4 3 5 7 6 8 9

//      Stream stream = Stream.fromIterable([Stream.fromIterable([1, 2, 3]), Stream.fromIterable([4, 5, 6]), Stream.fromIterable([7, 8, 9])]);
//      stream.flatMap((value) => value).listen(print);// 1 2 3 4 5 6 7 8 9
    }

    {
      // 合并流
//      Stream stream = Rx.merge([
//        Stream.fromIterable([1, 2, 3]),
//        Stream.fromIterable([4, 5, 6]),
//        Stream.fromIterable([7, 8, 9]),
//      ]);
//      stream.listen(print);// 1 4 7 2 5 8 3 6 9

    // 串联合并
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.mergeWith([
//        Stream.fromIterable([8, 9]),
//        Stream.fromIterable([88, 99])
//      ]).listen(print);// 1 8 88 2 9 99 3 4 5
    }

    {
      // 顺序执行多个流
//      Stream stream = Rx.concat([
//        Stream.fromIterable([1, 2, 3]),
//        Stream.fromIterable([4, 5, 6]),
//        Stream.fromIterable([7, 8, 9]),
//      ]);
//      stream.listen(print);// 1 2 3 4 5 6 7 8 9

    // 串联连接
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.concatWith([
//        Stream.fromIterable([8, 9]),
//        Stream.fromIterable([88, 99])
//      ]).listen(print);// 1 2 3 4 5 8 9 88 99
    }

    {
      // 任何流发生变化，都会触发新的事件
//      Rx.combineLatest([
//        Stream.fromIterable([1, 2, 3]),
//        Stream.fromIterable([4, 5]),
//      ], (values) {
//        print("最新的值 $values");
//        return values.join();
//      }).listen(print);// 14 25 35
    }

    {
      // 检查每个元素是否满足条件，只要有不满足条件的，就返回 false，否则 true
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.every((element) => element > 3).asStream().listen(print);// false
    }

    {
      // 流广播，可以多次订阅;
//      Stream stream = Stream.value(Random().nextInt(255)).asBroadcastStream();
//
//      stream.listen(print); // 1 2 3 4 5
//      stream.listen(print); // 1 2 3 4 5
    }

    {
      // 流无法在订阅之后，发送数据
//      Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);
//      stream.listen(print);

      // 流控制器，可以在订阅后继续接收数据
//      StreamController<int> controller = StreamController();
//      controller.add(1);
//      controller.stream.listen(print); // 1 2
//      controller.add(2);
    }

    {
      /// 冷热信号的区别就是看事件是否在 observable[可观测的] 里产生的
      /**
          // COLD
          var cold = new Observable((observer) => {
            var producer = new Producer();
            // have observer listen to producer here
          });

          // HOT
          var producer = new Producer();
          var hot = new Observable((observer) => {
            // have observer listen to producer here
          });
       */

      /// Hot Observable是主动的，尽管你并没有订阅事件，但是它会时刻推送，就像鼠标移动；而Cold Observable是被动的，只有当你订阅的时候，它才会发布消息。
      /// Hot Observable可以有多个订阅者，是一对多，集合可以与订阅者共享信息；而Cold Observable只能一对一，当有不同的订阅者，消息是重新完整发送。

      /// PublishSubject  BehaviorSubject ReplaySubject 都是热信号，因为收到的事件并没有对新的订阅者进行重新完整发送

      // 接收订阅之后的所有事件，只有订阅后才会开始接收事件
//      PublishSubject<int> subject = PublishSubject();
//      subject.add(1);
//      subject.stream.listen(print);
//      subject.add(2);
//      subject.add(3);
//      subject.stream.listen(print);
//      subject.add(4);

      // 2 3 4 4
    }

    {
      // 接收订阅前的最后一条数据和订阅后的所有数据
//      BehaviorSubject<int> subject = BehaviorSubject();
//      subject.add(0);
//      subject.add(1);
//      subject.stream.listen(print);
//      subject.add(2);
//      subject.add(3);
//      subject.stream.listen(print);
//      subject.add(4);

      // 1 2 3 3 4 4
    }

    {
      // 接收所有数据，包括订阅之前的所有数据和订阅后的所有数据
//      ReplaySubject<int> subject = ReplaySubject();
//      subject.add(1);
//      subject.add(2);
//      subject.add(3);
//
//      subject.stream.listen(print); // 1 2 3
//      subject.stream.listen(print); // 1 2 3
//      subject.stream.listen(print); // 1 2 3
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


