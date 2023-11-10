import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  String id;
  String description;
  int status;
  int priority;
  String attendUserId;
  String ticketUserId;
  int createdAt;
  int updatedAt;

  TicketModel({
    required this.id,
    required this.description,
    required this.status,
    required this.priority,
    required this.attendUserId,
    required this.ticketUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    id: json["id"],
    description: json["description"],
    status: json["status"],
    priority: json["priority"],
    attendUserId: json["attend_user_id"],
    ticketUserId: json["ticket_user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "status": status,
    "priority": priority,
    "attend_user_id": attendUserId,
    "ticket_user_id": ticketUserId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
