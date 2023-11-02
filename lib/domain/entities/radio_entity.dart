import 'package:equatable/equatable.dart';

class RadioEntity extends Equatable {
  int? id;
  String? name;
  String? url;
  RadioEntity({
    required this.id,
    required this.name,
    required this.url,
  });
  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    name,
    url,
  ];
}
