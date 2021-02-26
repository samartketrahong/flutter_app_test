import 'package:flutter/material.dart';
import 'package:flutter_app_test/transaction_provider.dart';
import 'package:provider/provider.dart';

class Catadd extends StatefulWidget {
  @override
  _CataddState createState() => _CataddState();
}

class _CataddState extends State<Catadd> {
  final formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController tailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มข้อมูลเเมว'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CatTextField(
                text: 'ชื่อเเมว',
                str: 'กรุณาใส่ชื่อเเมว',
                auto: true,
                controller: nameController,
              ),
              SizedBox(
                height: 10,
              ),
              CatTextField(
                str: 'กรุณาใส่ชื่อสายพันธ์',
                text: 'สายพันธ์เเมว',
                auto: false,
                controller: tailController,
              ),
              FlatButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      var nameCat = nameController.text;
                      var tailCat = tailController.text;
                      print(nameCat + tailCat);
                      Cat cat = Cat(name: nameCat, tail: tailCat);
                      var provider =
                          Provider.of<Transaction>(context, listen: false);
                      provider.addCat(cat);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text(
                      'เพิ่มข้อมูลเเมว',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CatTextField extends StatelessWidget {
  final String text;
  final bool auto;
  final String str;
  final TextEditingController controller;

  const CatTextField({
    Key key,
    this.text,
    this.auto,
    this.str,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        validator: (str) {
          if (str.isEmpty) {
            return this.str;
          }
          return null;
        },
        autofocus: auto,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: text,
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(8)),
    );
  }
}
