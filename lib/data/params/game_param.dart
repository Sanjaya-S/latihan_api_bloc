class GameParam{
  final int? id;
  final String name;
  final String price;
  final String? status;

  GameParam({this.id, required this.name, required this.price, this.status});

  Map<String, dynamic> toJson() {
    return{'name' : this.name, 'price': this.price, 'status': this.status};
  }
}