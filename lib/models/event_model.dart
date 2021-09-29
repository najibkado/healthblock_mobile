// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));

String eventsToJson(Events data) => json.encode(data.toJson());

class Events {
  Events({
    this.events,
  });

  List<Event> events;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  Event({
    this.staff,
    this.action,
    this.date,
  });

  String staff;
  String action;
  String date;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        staff: json["staff"],
        action: json["action"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "staff": staff,
        "action": action,
        "date": date,
      };
}
