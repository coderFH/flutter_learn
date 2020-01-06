import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        HomeContent1(),
        FormDemo(),
      ],
    );
  }
}

//============================== 8.表单 =============================
class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldDemoState();
  }
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //1.设置默认值
    textEditingController.text = "Hello World";


    //2.监听文本框
    textEditingController.addListener(() {
      print("${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: "username",
        hintText:"请输入用户名",
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.lightGreen
      ),
      onChanged: (value) {
        print("onChanged:$value");
      },
      onSubmitted: (value){
        print("onSubmintted:$value");
      },
    );
  }
}

class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFieldDemo()
        ],
      ),
    );
  }
}

//============================== 9.登录注册案例 =============================
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username,password;

  void registerForm() {
    registerFormKey.currentState.save();
    print("username:$username password:$password");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child:  TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: "用户名或手机号"
              ),
              onSaved: (value){
                this.username = value;
              },
              validator: (value){
                if(value.isEmpty) {
                  return "账号不能为空";
                }
                return null;
              },
              autovalidate: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "密码"
              ),
              onSaved: (value) {
                this.password = value;
              },
              validator: (value){
                if(value.isEmpty) {
                  return "密码不能为空";
                }
                return null;
              },
              autovalidate: true,
            ),
          ),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text("注 册", style: TextStyle(fontSize: 20, color: Colors.white),),
              onPressed:registerForm,
            ),
          )
        ],
      ),
    );
  }
}