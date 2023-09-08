import 'package:flutter_weather_app/features/weather/domain/entities/open_weather_response_entity.dart';

class Alert extends AlertEntity {
  const Alert({
    required senderName,
    required event,
    required start,
    required end,
    required description,
    required tags,
  }) : super(
          senderName: senderName,
          event: event,
          start: start,
          end: end,
          description: description,
          tags: tags,
        );

  factory Alert.fromMap(Map<String, dynamic> json) => Alert(
        senderName: json["sender_name"],
        event: json["event"],
        start: json["start"],
        end: json["end"],
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );
}
