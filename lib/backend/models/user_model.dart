/// name : ""
/// email : ""
/// id : ""

class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.id,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }
  String? name;
  String? email;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['id'] = id;
    return map;
  }

}