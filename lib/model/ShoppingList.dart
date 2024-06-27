class Shoppinglist {
  int? id;
  String? title;
  String? content;

  Shoppinglist({this.id, this.title, this.content});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{};

    if(id != null){
      map['id'] = id;
    }
    map['title'] = title;
    map['content'] = content;
    return map;
  }

  Shoppinglist.fromMap(Map<String, dynamic> map){
    id = map['id'];
    title = map['title'];
    content = map['content'];
  }
}