import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/itemModel.dart';

import '../controller/itemProvider.dart';

class ItemView extends StatelessWidget {
  static const String routeName = '/view';
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { Provider.of<ItemProvider>(context,listen: false).getAllitem();
    return Scaffold(appBar: AppBar(title: Text('View Items'),),
      body: Consumer<ItemProvider>(
          builder: (context, provider, child) {
            return provider.items.isEmpty? const Center(child: Text(''
            ),):
            ListView.builder(
              itemCount: provider.items.length,
              itemBuilder: (context, index) {
                final item =provider.items[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                  trailing:item.read==false?
                  OutlinedButton(onPressed:(){ItemProvider.updateProductField(item.id!, Fieldread, true);} ,child: Text('Mark as Read'),):IconButton(onPressed: (){
                    ItemProvider.deleteItem(item.id!);
                  }, icon: Icon(Icons.delete)),
                );
              },
            );
          }
      ),
    );
  }
}
