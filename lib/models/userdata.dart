// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    UserData({
        this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
    });

    int? page;
    int? perPage;
    int? total;
    int? totalPages;
    List<Datum>? data;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.img,
        this.until,
        this.amount,
        this.outOfAmount,
    });

    String? id;
    String? name;
    String? img;
    String? until;
    String? amount;
    String? outOfAmount;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["Name"],
        img: json["Img"],
        until: json["Until"],
        amount: json["Amount"],
        outOfAmount: json["OutOfAmount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "Img": img,
        "Until": until,
        "Amount": amount,
        "OutOfAmount": outOfAmount,
    };
}
