// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    final List<Datum> data;

    Event({
        required this.data,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String image;
    final String title;
    final int standardTicket;
    final int vipTickets;
    final int totalSales;

    Datum({
        required this.image,
        required this.title,
        required this.standardTicket,
        required this.vipTickets,
        required this.totalSales,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: json["image"],
        title: json["title"],
        standardTicket: json["standard_ticket"],
        vipTickets: json["vip_tickets"],
        totalSales: json["total_sales"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "standard_ticket": standardTicket,
        "vip_tickets": vipTickets,
        "total_sales": totalSales,
    };
}
