import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FHHeroDemo extends StatefulWidget {
  @override
  _FHAnimalRouterState createState() => _FHAnimalRouterState();
}

class _FHAnimalRouterState extends State<FHHeroDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查看图片")
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2,
          childAspectRatio: 16/9
        ),
        children: List.generate(20, (index) {
          final imageURL = "https://picsum.photos/500/500?random=$index";
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (ctx, anim1, anim2) {
                    return FadeTransition(opacity: anim1, child: HYImageDetailPage(imageURL));
                  }
              ));
            },
            child: Hero(
              tag: imageURL,
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
              )
          );
        }).toList(),
      )
    );
  }
}

class HYImageDetailPage extends StatelessWidget {
  final String _imageURL;

  HYImageDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(tag: _imageURL, child: Image.network(_imageURL))
        ),
      ),
    );
  }
}
