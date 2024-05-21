// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForecastClass _$ForecastClassFromJson(Map<String, dynamic> json) {
  return _ForecastClass.fromJson(json);
}

/// @nodoc
mixin _$ForecastClass {
  List<WeatherClass> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastClassCopyWith<ForecastClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastClassCopyWith<$Res> {
  factory $ForecastClassCopyWith(
          ForecastClass value, $Res Function(ForecastClass) then) =
      _$ForecastClassCopyWithImpl<$Res, ForecastClass>;
  @useResult
  $Res call({List<WeatherClass> list});
}

/// @nodoc
class _$ForecastClassCopyWithImpl<$Res, $Val extends ForecastClass>
    implements $ForecastClassCopyWith<$Res> {
  _$ForecastClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<WeatherClass>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForecastClassImplCopyWith<$Res>
    implements $ForecastClassCopyWith<$Res> {
  factory _$$ForecastClassImplCopyWith(
          _$ForecastClassImpl value, $Res Function(_$ForecastClassImpl) then) =
      __$$ForecastClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeatherClass> list});
}

/// @nodoc
class __$$ForecastClassImplCopyWithImpl<$Res>
    extends _$ForecastClassCopyWithImpl<$Res, _$ForecastClassImpl>
    implements _$$ForecastClassImplCopyWith<$Res> {
  __$$ForecastClassImplCopyWithImpl(
      _$ForecastClassImpl _value, $Res Function(_$ForecastClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$ForecastClassImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<WeatherClass>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastClassImpl implements _ForecastClass {
  _$ForecastClassImpl({required final List<WeatherClass> list}) : _list = list;

  factory _$ForecastClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastClassImplFromJson(json);

  final List<WeatherClass> _list;
  @override
  List<WeatherClass> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'ForecastClass(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastClassImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastClassImplCopyWith<_$ForecastClassImpl> get copyWith =>
      __$$ForecastClassImplCopyWithImpl<_$ForecastClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastClassImplToJson(
      this,
    );
  }
}

abstract class _ForecastClass implements ForecastClass {
  factory _ForecastClass({required final List<WeatherClass> list}) =
      _$ForecastClassImpl;

  factory _ForecastClass.fromJson(Map<String, dynamic> json) =
      _$ForecastClassImpl.fromJson;

  @override
  List<WeatherClass> get list;
  @override
  @JsonKey(ignore: true)
  _$$ForecastClassImplCopyWith<_$ForecastClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
