
import 'package:json_annotation/json_annotation.dart';
part 'tapete.g.dart';

@JsonSerializable(explicitToJson: true)
class Tapete {
  int id;
  String nome;
  double valor_m2;

  Tapete({required this.id, required this.nome, required this.valor_m2});

  factory Tapete.fromJson(Map<String, dynamic> json) =>
  _$TapeteFromJson(json);

  Map<String, dynamic> toJson() => _$TapeteToJson(this);
}