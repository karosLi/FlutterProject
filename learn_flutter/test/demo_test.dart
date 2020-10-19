import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/demo/k25_testing/test_demo.dart';

/// 项目目录下，命令行运行 flutter test
void main() {

  test('should return hello + somethings', () {
    var string = TestDemo.greet('ddd');
    expect(string, 'hello ddd');
  });

  testWidgets('widget testing demo', (WidgetTester tester) async {
    // 加载一个 widget
    await tester.pumpWidget(
      MaterialApp(
        home: TestWidget(),
      )
    );

    final labelText = find.text('hello');
    expect(labelText, findsNWidgets(1));

    final raisedButtonText = find.text('0');
    expect(raisedButtonText, findsNWidgets(1));

    final raisedButton = find.byType(RaisedButton);
    await tester.tap(raisedButton);
    // 重新构建
    await tester.pump();

    final raisedButtonTextAfterTap = find.text('1');
    expect(raisedButtonTextAfterTap, findsNWidgets(1));
    expect(raisedButtonText, findsNothing);

  });
}