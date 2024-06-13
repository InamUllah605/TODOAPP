import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoo_app/Conroller/DB%20Helper.dart';
import 'package:todoo_app/Conroller/Widget/Notes%20Model.dart';
import 'package:todoo_app/Conroller/Widget/Txtformfield.dart';

class UpddateData extends StatefulWidget {
  int id;
  String title;
  String mesage;
   UpddateData({super.key, required this.id, required this.title, required this.mesage});

  @override
  State<UpddateData> createState() => _UpddateDataState();
}

class _UpddateDataState extends State<UpddateData> {
  TextEditingController titleController=TextEditingController();
  TextEditingController messageController=TextEditingController();

  Future<void> updateNotes()async{
    NotesModel ref=NotesModel();
    ref.title=titleController.text;
    ref.message=messageController.text;
    DBHelper db=DBHelper.instance;
    db.update(widget.id ,ref);
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text=widget.title;
    messageController.text=widget.mesage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(height: 250,width: double.infinity,decoration: BoxDecoration(
                color: Colors.greenAccent.shade100,
                borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Txtformfield(
                    controller: titleController,
                    text: 'Update title',),
                  SizedBox(height: 10,),
                  Txtformfield(
                    controller: messageController,
                    text: 'Update message',),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    updateNotes();
                    Get.back();
                  }, child: Text('Update'))
                ],),
              ),
            ),
          )
        ],),
    );
  }
}
