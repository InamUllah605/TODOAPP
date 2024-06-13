import 'package:flutter/material.dart';
import 'package:todoo_app/Conroller/DB%20Helper.dart';
import 'package:todoo_app/Conroller/Widget/Notes%20Model.dart';
import 'package:todoo_app/Conroller/Widget/Txtformfield.dart';

class DataSave extends StatefulWidget {
  const DataSave({super.key});

  @override
  State<DataSave> createState() => _DataSaveState();
}

class _DataSaveState extends State<DataSave> {
  TextEditingController titleController=TextEditingController();
  TextEditingController messageController=TextEditingController();

  Future<void> addNotes()async{
    NotesModel ref=NotesModel();
    ref.title=titleController.text;
    ref.message=messageController.text;
    DBHelper db=DBHelper.instance;
    db.create(ref);
    Navigator.pop(context);
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
                    text: 'title',),
                  SizedBox(height: 10,),
                  Txtformfield(
                    controller: messageController,
                    text: 'message',),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    addNotes();
                  }, child: Text('Save'))
                ],),
              ),
            ),
          )
        ],),
    );
  }
}
