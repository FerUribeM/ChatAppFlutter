import 'dart:convert';

ResponseError responseErrorFromJson(String str) => ResponseError.fromJson(json.decode(str));

String responseErrorToJson(ResponseError data) => json.encode(data.toJson());

class ResponseError {
  ResponseError({
    this.ok,
    this.msg,
  });

  bool ok;
  String msg;

  factory ResponseError.fromJson(Map<String, dynamic> json) => ResponseError(
    ok: json["ok"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "msg": msg,
  };
}
