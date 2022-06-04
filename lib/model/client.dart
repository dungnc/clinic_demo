class Client {
  String? name;
  List<String?>? visited;

  Client({
    this.name,
    this.visited,
  });
  Client.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    if (json['visited'] != null) {
      final v = json['visited'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      visited = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (visited != null) {
      final v = visited;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['visited'] = arr0;
    }
    return data;
  }
}
