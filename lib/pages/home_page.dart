import 'package:flutter/material.dart';
import 'package:groceryapp/widgets/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          portrait: Column(),
          landscape: Row(),
        ),
      ),
    );
  }
}
