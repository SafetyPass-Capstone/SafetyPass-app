class Venue {
  final String name;
  final int capacity;
  const Venue({required this.name, required this.capacity});
}

class TicketInfo {
  final String eventTitle;
  final String place;
  final String date;
  final String seat;  // 예: "0A_4"
  final String zone;  // 예: "I자형"
  final String owner; // 예: "장민영"

  const TicketInfo({
    required this.eventTitle,
    required this.place,
    required this.date,
    required this.seat,
    required this.zone,
    required this.owner,
  });
}
