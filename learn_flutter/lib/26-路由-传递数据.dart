import 'package:flutter/material.dart';

//传递的数据结构,也可以理解为对商品数据的抽象
class Product{
  final String title;  //商品标题
  final String description;  //商品描述
  Product(this.title,this.description);
}

class ProductList extends StatefulWidget {
  ProductList({Key key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [];

  @override
  void initState() { 
    super.initState();
    this.products = List.generate(20, (i){
      return Product('商品:${i}', '商品详情:${i}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title:Text('商品列表')),
        body:ListView.builder(
          itemCount:products.length,
          itemBuilder: (context,index){
            return ListTile(
              title:Text(products[index].title),
              onTap:(){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder:(context)=>new ProductDetail(product:products[index])
                  )
                );
              }
            );
          },
        )
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key ,@required this.product}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text('${product.title}'),
      ),
      body:Center(child: Text('${product.description}'),)
    );
  }
}