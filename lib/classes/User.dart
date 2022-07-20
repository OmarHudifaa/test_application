import 'package:asset_people_application/classes/WordkOrder.dart';

/*class User{

  final String userid;
  final String apikey;

  String get getUserid{
    return userid;
  }
  String get getApikey{
    return apikey;
  }
  //final WorkOrder workOrder;
  User({ required this.userid,required this.apikey});
static fromJson(json){
  List<User>user=[];
  (json).entries.forEach((e) {
  user.add(json.map<User>(user).toList());
  });
return user;//json.map<User>(user).toList();
}
}*/

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.member,
   required this.href,
   required this.responseInfo,
  });

  List<Member> member;
  String href;
  ResponseInfo responseInfo;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    member: List<Member>.from(json["member"].map((x) => Member.fromJson(x))),
    href: json["href"],
    responseInfo: ResponseInfo.fromJson(json["responseInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "member": List<dynamic>.from(member.map((x) => x.toJson())),
    "href": href,
    "responseInfo": responseInfo.toJson(),
  };
}

class Member {
  Member({
    required this.rowstamp,
    required this.apikey,
    required this.href,
    required this.userid,
  });

  String rowstamp;
  String apikey;
  String href;
  String userid;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    rowstamp: json["_rowstamp"],
    apikey: json["apikey"],
    href: json["href"],
    userid: json["userid"],
  );

  Map<String, dynamic> toJson() => {
    "_rowstamp": rowstamp,
    "apikey": apikey,
    "href": href,
    "userid": userid,
  };
}

class ResponseInfo {
  ResponseInfo({
    required this.href,
  });

  String href;

  factory ResponseInfo.fromJson(Map<String, dynamic> json) => ResponseInfo(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}
