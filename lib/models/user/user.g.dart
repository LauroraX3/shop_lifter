// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      street: json['street'] as String? ?? '',
      zipCode: json['zipCode'] as String? ?? '',
      town: json['town'] as String? ?? '',
      email: json['email'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'street': instance.street,
      'zipCode': instance.zipCode,
      'town': instance.town,
      'email': instance.email,
    };
