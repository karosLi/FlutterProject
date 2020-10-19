import 'package:flutter/material.dart';
import 'bloc_base.dart';

/// 继承 StatefulWidget 是为了更好的销毁 bloc
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final T bloc;
  final Widget child;

  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc
  }) : super(key: key);

  static T of<T extends BlocBase>(BuildContext context) {
    return BlocInheritedWidget.of(context);
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocInheritedWidget(
      bloc: widget.bloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class BlocInheritedWidget<T extends BlocBase> extends InheritedWidget {
  final T bloc;

  BlocInheritedWidget({
    Key key,
    @required Widget child,
    @required this.bloc
  }) : super(key: key, child: child);

  static T of<T extends BlocBase>(BuildContext context) {
    BlocInheritedWidget widget = context.dependOnInheritedWidgetOfExactType();
    return widget.bloc;
  }

  @override
  bool updateShouldNotify(BlocInheritedWidget oldWidget) {
    return true;
  }
}
