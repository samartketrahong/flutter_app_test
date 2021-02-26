import 'package:flutter/material.dart';
import 'addCat.dart';
import 'package:provider/provider.dart';
import 'transaction_provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return Transaction();
        },)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'ฐานข้อมูลน้องเเมว'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('res/logo.png',color: Colors.white,),
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child: Consumer(builder: (context,Transaction provider,child){
          if(provider.cat.length == 0 ){
            return Center(child: Text('ไม่พบข้อมูล',style: TextStyle(fontSize: 20),));
          }else{
            return ListView.builder(
              itemBuilder: (context, index) {
                return CatDetail(
                  name: provider.cat[index].name,
                  tail: provider.cat[index].tail,
                );
              },
              itemCount: provider.cat.length,
            );
          }

        },)
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Catadd()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

class CatDetail extends StatelessWidget {
  final String name;
  final String tail;

  const CatDetail({
    Key key,
    this.name,
    this.tail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){},
        title: Text(name),
        subtitle: Text(tail),
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Image.asset('res/logo.png',color: Colors.white,),
        ),
      ),
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
