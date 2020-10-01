import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.ok,
    this.usuario,
    this.token,
  });

  bool ok;
  Usuario usuario;
  String token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    ok: json["ok"],
    usuario: Usuario.fromJson(json["msg"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "msg": usuario.toJson(),
    "token": token,
  };
}

class Usuario {
  Usuario({
    this.online,
    this.name,
    this.email,
    this.uid,
  });

  bool online;
  String name;
  String email;
  String uid;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    online: json["online"],
    name: json["name"],
    email: json["email"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "online": online,
    "name": name,
    "email": email,
    "uid": uid,
  };
}
