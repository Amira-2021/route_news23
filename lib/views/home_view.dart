import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_nuews23/widgets/custom_grid_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          "NewsApp",
          style: TextStyle(fontSize: 22),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.edit),
      ),
      body: CustomGridView(),
    );
  }
}
