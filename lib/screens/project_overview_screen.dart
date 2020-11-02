import 'package:flutter/material.dart';

import '../widgets/grid_item.dart';

class ProjectOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridItem(),
    );
  }
}
