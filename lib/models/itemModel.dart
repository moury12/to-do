const String collectionItem = 'items';
const String FieldId = 'uid';
const String Fieldtitle = 'Title';
const String Fielddesc = 'Description';
const String Fieldread = 'Read';
class ItemModel{
  String? id;
  String title;
  String description;
  bool? read;

  ItemModel({this.id ,required this.title, required this.description, this.read=false});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FieldId: id,
      Fieldtitle: title,
      Fielddesc: description,
      Fieldread: read,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) => ItemModel(
    id: map[FieldId],
    title: map[Fieldtitle],
    description: map[Fielddesc],
    read: map[Fieldread],
  );
}