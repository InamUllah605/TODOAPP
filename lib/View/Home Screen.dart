import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoo_app/Conroller/DB%20Helper.dart';
import 'package:todoo_app/View/Data%20Save%20Screen.dart';
import 'package:todoo_app/View/update-data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List readmyData=[];

  readData() async{
    print('read function calling-------');
    DBHelper obj=DBHelper.instance;
    var readmyData= await obj.read();


    setState(() {
      this.readmyData=readmyData;
    });
  }
  delete(int id)async
  {
    DBHelper ref= await DBHelper.instance;

    ref.delete(id);

    readData();
    setState(() {

    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init calling');
    readData();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.shade200,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          readData();
        }, icon: Icon(Icons.refresh
        )),],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 20),
          child: Row(
            children: [
              Text('To doo',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
       readmyData.isEmpty ?Center(child: Text('No data Available',style: TextStyle(color: Colors.white,
           fontSize: 20,),),):

        Expanded(child: Container(decoration: BoxDecoration(
            color: Colors.greenAccent.shade200,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ListView.builder(
              itemCount: readmyData.length,
              itemBuilder: (context, index)
              {
                int id=readmyData[index]['id'];
                String title=readmyData[index]['title'];
                String message=readmyData[index]['message'];
                return Card(
                    child: ListTile(
                      onLongPress: (){
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpddateData(id: id,title: title,mesage: message,)));
                      },
                      leading: CircleAvatar(child: Text('$id')),
                      title: Text(title),
                      subtitle: Text(message),
                       trailing: PopupMenuButton<String>(
                         onSelected: (String value)
                         {
                           if(value=='delete')
                             {
                                 Get.defaultDialog(title: "Are you sure?",
                                   middleText: ('Your data is delete'),
                                   actions: [
                                     TextButton(onPressed: (){
                                       Navigator.pop(context);
                                     }, child: Text('Cancel')),
                                     TextButton(onPressed: (){
                                        delete(id);
                                        Get.back();
                                     }, child: Text('Confirm'))
                                   ]
                                 );
                             }
                           if(value=='edit')
                             {
                               Get.defaultDialog(title: "Are you sure?",
                                   middleText: ('Update Data'),
                                   actions: [
                                     TextButton(onPressed: (){
                                       Navigator.pop(context);
                                     }, child: Text('Cancel')),
                                     TextButton(onPressed: (){
                                       Navigator.push(context, CupertinoPageRoute(builder: (context)=>UpddateData(id: id,title: title,mesage: message,)));
                                       }, child: Text('Confirm'))
                                   ]
                               );
                             }
                         },

                         itemBuilder: (context) => [

                           PopupMenuItem<String>(
                             value:'delete',
                           child: ListTile(
                             leading: Icon(Icons.delete),
                             title: Text('Delete'),
                           ),
                         ),
                         PopupMenuItem<String>(
                           value: 'edit',
                         child: ListTile(
                           leading: Icon(Icons.edit),
                           title: Text('Edit'),
                         ),
                            ),
                       ],)
                    ));
              }
            ),
          ),
        ))
      ],),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>DataSave()));
      },child: Icon(Icons.add),),
    );
  }
}

