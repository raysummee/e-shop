import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? uid;
  final String? email;
  final String? password;
  final String? name;
  
  const UserModel({
    this.uid,
    this.email,
    this.password,
    this.name,
  });

  @override
  List<Object> get props => [uid??"", email??"", password??"", name??""];

  UserModel copyWith({
    String? uid,
    String? email,
    String? password,
    String? name,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }


  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        name = doc.data()!["name"],
        password = null;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(uid != null){
      result.addAll({'uid': uid});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(name != null){
      result.addAll({'name': name});
    }
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      password: map['password'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
