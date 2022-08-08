// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

  UserModel({
    this.uid,
    this.lengthofitem,
    this.email,
    this.pathlist,
  });

  String? uid;
  String? email;
  String? lengthofitem;
  List<String>? pathlist;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json["uid"] == null ? null : json["uid"],
    email: json["email"] == null ? null : json["email"],
    lengthofitem: json["lengthofitem"] == null ? null : json["lengthofitem"],
    pathlist: json["pathlist"] == null ? null : List<String>.from(json["pathlist"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid == null ? null : uid,
    "email": email == null ? null : email,
    "lengthofitem": lengthofitem == null ? null : lengthofitem,
    "pathlist": pathlist == null ? null : List<dynamic>.from(pathlist!.map((x) => x)),
  };
}
