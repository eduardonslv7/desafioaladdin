// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tapete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tapete _$TapeteFromJson(Map<String, dynamic> json) => Tapete(
      id: json['id'] as int,
      nome: json['nome'] as String,
      valor_m2: (json['valor_m2'] as num).toDouble(),
    );

Map<String, dynamic> _$TapeteToJson(Tapete instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'valor_m2': instance.valor_m2,
    };
