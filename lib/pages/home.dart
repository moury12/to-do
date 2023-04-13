import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/controller/itemProvider.dart';
import 'package:testapp/models/itemModel.dart';
import 'package:testapp/pages/itemview.dart';
class Home extends StatefulWidget {
  static const String routeName = '/';
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController titleController= TextEditingController();
late ItemProvider itemProvider;
  final TextEditingController descController= TextEditingController();
  @override
  void didChangeDependencies() {
    itemProvider = Provider.of<ItemProvider>(context, listen: false);
    super.didChangeDependencies();
  }
@override
  void dispose() {
titleController.dispose();
descController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

  return Scaffold(appBar: AppBar(title: Text('Home'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: ElevatedButton(onPressed: (){ showOptionDialog(context);}, child: Text('Add item'))),
          ElevatedButton(onPressed: (){  Navigator.pushNamed(context, ItemView.routeName);}, child: Text('view items')),

        ],
      ),
    );
  }

   showOptionDialog(BuildContext context) {
     return showDialog(context: context, builder: (context)=>
     SimpleDialog(backgroundColor: Colors.white,
     children: [
       SimpleDialogOption(
child:  TextField(
  controller: titleController,
  decoration: InputDecoration(
      label: Text('Title')
  ),
),       ) ,SimpleDialogOption(
child:  TextField(
  controller: descController,
  decoration: InputDecoration(

      label: Text('Description')
  ),
),       ),
       SimpleDialogOption(
         child: ElevatedButton(onPressed: (){
           _submit();
         },
         child: Text('Submit'),),
       )
     ]));
   }

  void _submit()async {
  if(titleController.text.isEmpty||titleController.text.isEmpty){
    showMsg(context, 'Field requird');
  }
else{
try{
final items=ItemModel(title: titleController.text, description: descController.text);
await itemProvider.addItem(items);
showMsg(context, 'Item Added');
}catch(e){
showMsg(context, e.toString());
}
  }
  }
}
showMsg(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}