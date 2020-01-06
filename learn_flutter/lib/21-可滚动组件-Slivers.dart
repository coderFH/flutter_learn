import 'package:flutter/material.dart';

class MySlivers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index) {
                        return Container(
                          alignment: Alignment(0, 0),
                          color: Colors.orange,
                          child: Text("item$index"),
                        );
                      }
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

