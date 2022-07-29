// To parse this JSON data, do
//
//     final workorder = workorderFromJson(jsonString);

import 'dart:convert';

Workorder workorderFromJson(var str) => Workorder.fromJson(str);

String workorderToJson(Workorder data) => json.encode(data.toJson());

class Workorder {
  Workorder({
    required this.member,
    required this.href,
    required this.responseInfo,
  });

  List<Member> member;
  String href;
  ResponseInfo responseInfo;

  factory Workorder.fromJson(Map<String, dynamic> json) => Workorder(
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
    required this.wpmaterialCollectionref,
    required this.labtransCollectionref,
    required this.description,
    required this.woactivityCollectionref,
    required this.wplaborCollectionref,
    required this.wpserviceCollectionref,
    required this.rowstamp,
    required this.invreserveCollectionref,
    required this.wptoolCollectionref,
    required this.siteid,
    required this.relatedrecordCollectionref,
    required this.failurereportCollectionref,
    required this.href,
    required this.assignmentCollectionref,
    required this.multiassetlocciCollectionref,
    required this.statusDescription,
    required this.worklogCollectionref,
    required this.matusetransCollectionref,
    required this.tooltransCollectionref,
    required this.moddowntimehistCollectionref,
    required this.wonum,
    required this.longdescription,
    required this.woserviceaddressCollectionref,
    required this.servrectransCollectionref,
    required this.status,
  });

  String? wpmaterialCollectionref;
  String? labtransCollectionref;
  String? description;
  String? woactivityCollectionref;
  String? wplaborCollectionref;
  String? wpserviceCollectionref;
  String? rowstamp;
  String? invreserveCollectionref;
  String? wptoolCollectionref;
  String? siteid;
  String? relatedrecordCollectionref;
  String? failurereportCollectionref;
  String? href;
  String? assignmentCollectionref;
  String? multiassetlocciCollectionref;
  String? statusDescription;
  String? worklogCollectionref;
  String? matusetransCollectionref;
  String? tooltransCollectionref;
  String? moddowntimehistCollectionref;
  String? wonum;
  Longdescription? longdescription;
  String? woserviceaddressCollectionref;
  String? servrectransCollectionref;
  String? status;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        wpmaterialCollectionref: json["wpmaterial_collectionref"],
        labtransCollectionref: json["labtrans_collectionref"],
        description: json["description"],
        woactivityCollectionref: json["woactivity_collectionref"],
        wplaborCollectionref: json["wplabor_collectionref"],
        wpserviceCollectionref: json["wpservice_collectionref"],
        rowstamp: json["_rowstamp"],
        invreserveCollectionref: json["invreserve_collectionref"],
        wptoolCollectionref: json["wptool_collectionref"],
        siteid: json["siteid"],
        relatedrecordCollectionref: json["relatedrecord_collectionref"],
        failurereportCollectionref: json["failurereport_collectionref"],
        href: json["href"],
        assignmentCollectionref: json["assignment_collectionref"],
        multiassetlocciCollectionref: json["multiassetlocci_collectionref"],
        statusDescription: json["status_description"],
        worklogCollectionref: json["worklog_collectionref"],
        matusetransCollectionref: json["matusetrans_collectionref"],
        tooltransCollectionref: json["tooltrans_collectionref"],
        moddowntimehistCollectionref: json["moddowntimehist_collectionref"],
        wonum: json["wonum"],
        longdescription: Longdescription.fromJson(json["longdescription"]),
        woserviceaddressCollectionref: json["woserviceaddress_collectionref"],
        servrectransCollectionref: json["servrectrans_collectionref"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "wpmaterial_collectionref": wpmaterialCollectionref,
        "labtrans_collectionref": labtransCollectionref,
        "description": description,
        "woactivity_collectionref": woactivityCollectionref,
        "wplabor_collectionref": wplaborCollectionref,
        "wpservice_collectionref": wpserviceCollectionref,
        "_rowstamp": rowstamp,
        "invreserve_collectionref": invreserveCollectionref,
        "wptool_collectionref": wptoolCollectionref,
        "siteid": siteid,
        "relatedrecord_collectionref": relatedrecordCollectionref,
        "failurereport_collectionref": failurereportCollectionref,
        "href": href,
        "assignment_collectionref": assignmentCollectionref,
        "multiassetlocci_collectionref": multiassetlocciCollectionref,
        "status_description": statusDescription,
        "worklog_collectionref": worklogCollectionref,
        "matusetrans_collectionref": matusetransCollectionref,
        "tooltrans_collectionref": tooltransCollectionref,
        "moddowntimehist_collectionref": moddowntimehistCollectionref,
        "wonum": wonum,
        "longdescription": longdescription?.toJson(),
        "woserviceaddress_collectionref": woserviceaddressCollectionref,
        "servrectrans_collectionref": servrectransCollectionref,
        "status": status,
      };
}

class Longdescription {
  Longdescription({
    required this.ldtext,
  });

  String? ldtext;

  factory Longdescription.fromJson(Map<String, dynamic> json) => Longdescription(
        ldtext: json["ldtext"] == null ? null : json["ldtext"],
      );

  Map<String, dynamic> toJson() => {
        "ldtext": ldtext == null ? null : ldtext,
      };
}

class ResponseInfo {
  ResponseInfo({
    required this.href,
    required this.pagenum,
  });

  String href;
  int pagenum;

  factory ResponseInfo.fromJson(Map<String, dynamic> json) => ResponseInfo(
        href: json["href"],
        pagenum: json["pagenum"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "pagenum": pagenum,
      };
}
