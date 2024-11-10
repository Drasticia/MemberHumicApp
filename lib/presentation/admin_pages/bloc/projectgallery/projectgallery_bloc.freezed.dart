// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projectgallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectgalleryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(int id) fetchById,
    required TResult Function(int id, String status, String comment)
        updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAll,
    TResult? Function(int id)? fetchById,
    TResult? Function(int id, String status, String comment)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(int id)? fetchById,
    TResult Function(int id, String status, String comment)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllProjectGallery value) fetchAll,
    required TResult Function(FetchProjectGalleryById value) fetchById,
    required TResult Function(UpdateProjectGalleryStatus value) updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAllProjectGallery value)? fetchAll,
    TResult? Function(FetchProjectGalleryById value)? fetchById,
    TResult? Function(UpdateProjectGalleryStatus value)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllProjectGallery value)? fetchAll,
    TResult Function(FetchProjectGalleryById value)? fetchById,
    TResult Function(UpdateProjectGalleryStatus value)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectgalleryEventCopyWith<$Res> {
  factory $ProjectgalleryEventCopyWith(
          ProjectgalleryEvent value, $Res Function(ProjectgalleryEvent) then) =
      _$ProjectgalleryEventCopyWithImpl<$Res, ProjectgalleryEvent>;
}

/// @nodoc
class _$ProjectgalleryEventCopyWithImpl<$Res, $Val extends ProjectgalleryEvent>
    implements $ProjectgalleryEventCopyWith<$Res> {
  _$ProjectgalleryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchAllProjectGalleryImplCopyWith<$Res> {
  factory _$$FetchAllProjectGalleryImplCopyWith(
          _$FetchAllProjectGalleryImpl value,
          $Res Function(_$FetchAllProjectGalleryImpl) then) =
      __$$FetchAllProjectGalleryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAllProjectGalleryImplCopyWithImpl<$Res>
    extends _$ProjectgalleryEventCopyWithImpl<$Res,
        _$FetchAllProjectGalleryImpl>
    implements _$$FetchAllProjectGalleryImplCopyWith<$Res> {
  __$$FetchAllProjectGalleryImplCopyWithImpl(
      _$FetchAllProjectGalleryImpl _value,
      $Res Function(_$FetchAllProjectGalleryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchAllProjectGalleryImpl implements FetchAllProjectGallery {
  const _$FetchAllProjectGalleryImpl();

  @override
  String toString() {
    return 'ProjectgalleryEvent.fetchAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllProjectGalleryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(int id) fetchById,
    required TResult Function(int id, String status, String comment)
        updateStatus,
  }) {
    return fetchAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAll,
    TResult? Function(int id)? fetchById,
    TResult? Function(int id, String status, String comment)? updateStatus,
  }) {
    return fetchAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(int id)? fetchById,
    TResult Function(int id, String status, String comment)? updateStatus,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllProjectGallery value) fetchAll,
    required TResult Function(FetchProjectGalleryById value) fetchById,
    required TResult Function(UpdateProjectGalleryStatus value) updateStatus,
  }) {
    return fetchAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAllProjectGallery value)? fetchAll,
    TResult? Function(FetchProjectGalleryById value)? fetchById,
    TResult? Function(UpdateProjectGalleryStatus value)? updateStatus,
  }) {
    return fetchAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllProjectGallery value)? fetchAll,
    TResult Function(FetchProjectGalleryById value)? fetchById,
    TResult Function(UpdateProjectGalleryStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll(this);
    }
    return orElse();
  }
}

abstract class FetchAllProjectGallery implements ProjectgalleryEvent {
  const factory FetchAllProjectGallery() = _$FetchAllProjectGalleryImpl;
}

/// @nodoc
abstract class _$$FetchProjectGalleryByIdImplCopyWith<$Res> {
  factory _$$FetchProjectGalleryByIdImplCopyWith(
          _$FetchProjectGalleryByIdImpl value,
          $Res Function(_$FetchProjectGalleryByIdImpl) then) =
      __$$FetchProjectGalleryByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchProjectGalleryByIdImplCopyWithImpl<$Res>
    extends _$ProjectgalleryEventCopyWithImpl<$Res,
        _$FetchProjectGalleryByIdImpl>
    implements _$$FetchProjectGalleryByIdImplCopyWith<$Res> {
  __$$FetchProjectGalleryByIdImplCopyWithImpl(
      _$FetchProjectGalleryByIdImpl _value,
      $Res Function(_$FetchProjectGalleryByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchProjectGalleryByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchProjectGalleryByIdImpl implements FetchProjectGalleryById {
  const _$FetchProjectGalleryByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProjectgalleryEvent.fetchById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchProjectGalleryByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchProjectGalleryByIdImplCopyWith<_$FetchProjectGalleryByIdImpl>
      get copyWith => __$$FetchProjectGalleryByIdImplCopyWithImpl<
          _$FetchProjectGalleryByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(int id) fetchById,
    required TResult Function(int id, String status, String comment)
        updateStatus,
  }) {
    return fetchById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAll,
    TResult? Function(int id)? fetchById,
    TResult? Function(int id, String status, String comment)? updateStatus,
  }) {
    return fetchById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(int id)? fetchById,
    TResult Function(int id, String status, String comment)? updateStatus,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllProjectGallery value) fetchAll,
    required TResult Function(FetchProjectGalleryById value) fetchById,
    required TResult Function(UpdateProjectGalleryStatus value) updateStatus,
  }) {
    return fetchById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAllProjectGallery value)? fetchAll,
    TResult? Function(FetchProjectGalleryById value)? fetchById,
    TResult? Function(UpdateProjectGalleryStatus value)? updateStatus,
  }) {
    return fetchById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllProjectGallery value)? fetchAll,
    TResult Function(FetchProjectGalleryById value)? fetchById,
    TResult Function(UpdateProjectGalleryStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(this);
    }
    return orElse();
  }
}

abstract class FetchProjectGalleryById implements ProjectgalleryEvent {
  const factory FetchProjectGalleryById(final int id) =
      _$FetchProjectGalleryByIdImpl;

  int get id;

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchProjectGalleryByIdImplCopyWith<_$FetchProjectGalleryByIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProjectGalleryStatusImplCopyWith<$Res> {
  factory _$$UpdateProjectGalleryStatusImplCopyWith(
          _$UpdateProjectGalleryStatusImpl value,
          $Res Function(_$UpdateProjectGalleryStatusImpl) then) =
      __$$UpdateProjectGalleryStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String status, String comment});
}

/// @nodoc
class __$$UpdateProjectGalleryStatusImplCopyWithImpl<$Res>
    extends _$ProjectgalleryEventCopyWithImpl<$Res,
        _$UpdateProjectGalleryStatusImpl>
    implements _$$UpdateProjectGalleryStatusImplCopyWith<$Res> {
  __$$UpdateProjectGalleryStatusImplCopyWithImpl(
      _$UpdateProjectGalleryStatusImpl _value,
      $Res Function(_$UpdateProjectGalleryStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? comment = null,
  }) {
    return _then(_$UpdateProjectGalleryStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateProjectGalleryStatusImpl implements UpdateProjectGalleryStatus {
  const _$UpdateProjectGalleryStatusImpl(
      {required this.id, required this.status, required this.comment});

  @override
  final int id;
  @override
  final String status;
  @override
  final String comment;

  @override
  String toString() {
    return 'ProjectgalleryEvent.updateStatus(id: $id, status: $status, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProjectGalleryStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status, comment);

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProjectGalleryStatusImplCopyWith<_$UpdateProjectGalleryStatusImpl>
      get copyWith => __$$UpdateProjectGalleryStatusImplCopyWithImpl<
          _$UpdateProjectGalleryStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(int id) fetchById,
    required TResult Function(int id, String status, String comment)
        updateStatus,
  }) {
    return updateStatus(id, status, comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAll,
    TResult? Function(int id)? fetchById,
    TResult? Function(int id, String status, String comment)? updateStatus,
  }) {
    return updateStatus?.call(id, status, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(int id)? fetchById,
    TResult Function(int id, String status, String comment)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(id, status, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAllProjectGallery value) fetchAll,
    required TResult Function(FetchProjectGalleryById value) fetchById,
    required TResult Function(UpdateProjectGalleryStatus value) updateStatus,
  }) {
    return updateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAllProjectGallery value)? fetchAll,
    TResult? Function(FetchProjectGalleryById value)? fetchById,
    TResult? Function(UpdateProjectGalleryStatus value)? updateStatus,
  }) {
    return updateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAllProjectGallery value)? fetchAll,
    TResult Function(FetchProjectGalleryById value)? fetchById,
    TResult Function(UpdateProjectGalleryStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(this);
    }
    return orElse();
  }
}

abstract class UpdateProjectGalleryStatus implements ProjectgalleryEvent {
  const factory UpdateProjectGalleryStatus(
      {required final int id,
      required final String status,
      required final String comment}) = _$UpdateProjectGalleryStatusImpl;

  int get id;
  String get status;
  String get comment;

  /// Create a copy of ProjectgalleryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProjectGalleryStatusImplCopyWith<_$UpdateProjectGalleryStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectgalleryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectgalleryStateCopyWith<$Res> {
  factory $ProjectgalleryStateCopyWith(
          ProjectgalleryState value, $Res Function(ProjectgalleryState) then) =
      _$ProjectgalleryStateCopyWithImpl<$Res, ProjectgalleryState>;
}

/// @nodoc
class _$ProjectgalleryStateCopyWithImpl<$Res, $Val extends ProjectgalleryState>
    implements $ProjectgalleryStateCopyWith<$Res> {
  _$ProjectgalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProjectGalleryInitialImplCopyWith<$Res> {
  factory _$$ProjectGalleryInitialImplCopyWith(
          _$ProjectGalleryInitialImpl value,
          $Res Function(_$ProjectGalleryInitialImpl) then) =
      __$$ProjectGalleryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectGalleryInitialImplCopyWithImpl<$Res>
    extends _$ProjectgalleryStateCopyWithImpl<$Res, _$ProjectGalleryInitialImpl>
    implements _$$ProjectGalleryInitialImplCopyWith<$Res> {
  __$$ProjectGalleryInitialImplCopyWithImpl(_$ProjectGalleryInitialImpl _value,
      $Res Function(_$ProjectGalleryInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectGalleryInitialImpl implements ProjectGalleryInitial {
  const _$ProjectGalleryInitialImpl();

  @override
  String toString() {
    return 'ProjectgalleryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProjectGalleryInitial implements ProjectgalleryState {
  const factory ProjectGalleryInitial() = _$ProjectGalleryInitialImpl;
}

/// @nodoc
abstract class _$$ProjectGalleryLoadingImplCopyWith<$Res> {
  factory _$$ProjectGalleryLoadingImplCopyWith(
          _$ProjectGalleryLoadingImpl value,
          $Res Function(_$ProjectGalleryLoadingImpl) then) =
      __$$ProjectGalleryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectGalleryLoadingImplCopyWithImpl<$Res>
    extends _$ProjectgalleryStateCopyWithImpl<$Res, _$ProjectGalleryLoadingImpl>
    implements _$$ProjectGalleryLoadingImplCopyWith<$Res> {
  __$$ProjectGalleryLoadingImplCopyWithImpl(_$ProjectGalleryLoadingImpl _value,
      $Res Function(_$ProjectGalleryLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectGalleryLoadingImpl implements ProjectGalleryLoading {
  const _$ProjectGalleryLoadingImpl();

  @override
  String toString() {
    return 'ProjectgalleryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProjectGalleryLoading implements ProjectgalleryState {
  const factory ProjectGalleryLoading() = _$ProjectGalleryLoadingImpl;
}

/// @nodoc
abstract class _$$ProjectGalleryLoadedImplCopyWith<$Res> {
  factory _$$ProjectGalleryLoadedImplCopyWith(_$ProjectGalleryLoadedImpl value,
          $Res Function(_$ProjectGalleryLoadedImpl) then) =
      __$$ProjectGalleryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Data> galleries});
}

/// @nodoc
class __$$ProjectGalleryLoadedImplCopyWithImpl<$Res>
    extends _$ProjectgalleryStateCopyWithImpl<$Res, _$ProjectGalleryLoadedImpl>
    implements _$$ProjectGalleryLoadedImplCopyWith<$Res> {
  __$$ProjectGalleryLoadedImplCopyWithImpl(_$ProjectGalleryLoadedImpl _value,
      $Res Function(_$ProjectGalleryLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleries = null,
  }) {
    return _then(_$ProjectGalleryLoadedImpl(
      null == galleries
          ? _value._galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<Data>,
    ));
  }
}

/// @nodoc

class _$ProjectGalleryLoadedImpl implements ProjectGalleryLoaded {
  const _$ProjectGalleryLoadedImpl(final List<Data> galleries)
      : _galleries = galleries;

  final List<Data> _galleries;
  @override
  List<Data> get galleries {
    if (_galleries is EqualUnmodifiableListView) return _galleries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleries);
  }

  @override
  String toString() {
    return 'ProjectgalleryState.loaded(galleries: $galleries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._galleries, _galleries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_galleries));

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectGalleryLoadedImplCopyWith<_$ProjectGalleryLoadedImpl>
      get copyWith =>
          __$$ProjectGalleryLoadedImplCopyWithImpl<_$ProjectGalleryLoadedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) {
    return loaded(galleries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(galleries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(galleries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProjectGalleryLoaded implements ProjectgalleryState {
  const factory ProjectGalleryLoaded(final List<Data> galleries) =
      _$ProjectGalleryLoadedImpl;

  List<Data> get galleries;

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectGalleryLoadedImplCopyWith<_$ProjectGalleryLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectGalleryLoadedSingleImplCopyWith<$Res> {
  factory _$$ProjectGalleryLoadedSingleImplCopyWith(
          _$ProjectGalleryLoadedSingleImpl value,
          $Res Function(_$ProjectGalleryLoadedSingleImpl) then) =
      __$$ProjectGalleryLoadedSingleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Data gallery});
}

/// @nodoc
class __$$ProjectGalleryLoadedSingleImplCopyWithImpl<$Res>
    extends _$ProjectgalleryStateCopyWithImpl<$Res,
        _$ProjectGalleryLoadedSingleImpl>
    implements _$$ProjectGalleryLoadedSingleImplCopyWith<$Res> {
  __$$ProjectGalleryLoadedSingleImplCopyWithImpl(
      _$ProjectGalleryLoadedSingleImpl _value,
      $Res Function(_$ProjectGalleryLoadedSingleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gallery = null,
  }) {
    return _then(_$ProjectGalleryLoadedSingleImpl(
      null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

class _$ProjectGalleryLoadedSingleImpl implements ProjectGalleryLoadedSingle {
  const _$ProjectGalleryLoadedSingleImpl(this.gallery);

  @override
  final Data gallery;

  @override
  String toString() {
    return 'ProjectgalleryState.loadedSingle(gallery: $gallery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryLoadedSingleImpl &&
            (identical(other.gallery, gallery) || other.gallery == gallery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gallery);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectGalleryLoadedSingleImplCopyWith<_$ProjectGalleryLoadedSingleImpl>
      get copyWith => __$$ProjectGalleryLoadedSingleImplCopyWithImpl<
          _$ProjectGalleryLoadedSingleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) {
    return loadedSingle(gallery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) {
    return loadedSingle?.call(gallery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedSingle != null) {
      return loadedSingle(gallery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) {
    return loadedSingle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) {
    return loadedSingle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (loadedSingle != null) {
      return loadedSingle(this);
    }
    return orElse();
  }
}

abstract class ProjectGalleryLoadedSingle implements ProjectgalleryState {
  const factory ProjectGalleryLoadedSingle(final Data gallery) =
      _$ProjectGalleryLoadedSingleImpl;

  Data get gallery;

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectGalleryLoadedSingleImplCopyWith<_$ProjectGalleryLoadedSingleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectGalleryUpdatedImplCopyWith<$Res> {
  factory _$$ProjectGalleryUpdatedImplCopyWith(
          _$ProjectGalleryUpdatedImpl value,
          $Res Function(_$ProjectGalleryUpdatedImpl) then) =
      __$$ProjectGalleryUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectGalleryUpdatedImplCopyWithImpl<$Res>
    extends _$ProjectgalleryStateCopyWithImpl<$Res, _$ProjectGalleryUpdatedImpl>
    implements _$$ProjectGalleryUpdatedImplCopyWith<$Res> {
  __$$ProjectGalleryUpdatedImplCopyWithImpl(_$ProjectGalleryUpdatedImpl _value,
      $Res Function(_$ProjectGalleryUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectGalleryUpdatedImpl implements ProjectGalleryUpdated {
  const _$ProjectGalleryUpdatedImpl();

  @override
  String toString() {
    return 'ProjectgalleryState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class ProjectGalleryUpdated implements ProjectgalleryState {
  const factory ProjectGalleryUpdated() = _$ProjectGalleryUpdatedImpl;
}

/// @nodoc
abstract class _$$ProjectGalleryErrorImplCopyWith<$Res> {
  factory _$$ProjectGalleryErrorImplCopyWith(_$ProjectGalleryErrorImpl value,
          $Res Function(_$ProjectGalleryErrorImpl) then) =
      __$$ProjectGalleryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProjectGalleryErrorImplCopyWithImpl<$Res>
    extends _$ProjectgalleryStateCopyWithImpl<$Res, _$ProjectGalleryErrorImpl>
    implements _$$ProjectGalleryErrorImplCopyWith<$Res> {
  __$$ProjectGalleryErrorImplCopyWithImpl(_$ProjectGalleryErrorImpl _value,
      $Res Function(_$ProjectGalleryErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProjectGalleryErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProjectGalleryErrorImpl implements ProjectGalleryError {
  const _$ProjectGalleryErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProjectgalleryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectGalleryErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectGalleryErrorImplCopyWith<_$ProjectGalleryErrorImpl> get copyWith =>
      __$$ProjectGalleryErrorImplCopyWithImpl<_$ProjectGalleryErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Data> galleries) loaded,
    required TResult Function(Data gallery) loadedSingle,
    required TResult Function() updated,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Data> galleries)? loaded,
    TResult? Function(Data gallery)? loadedSingle,
    TResult? Function()? updated,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Data> galleries)? loaded,
    TResult Function(Data gallery)? loadedSingle,
    TResult Function()? updated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectGalleryInitial value) initial,
    required TResult Function(ProjectGalleryLoading value) loading,
    required TResult Function(ProjectGalleryLoaded value) loaded,
    required TResult Function(ProjectGalleryLoadedSingle value) loadedSingle,
    required TResult Function(ProjectGalleryUpdated value) updated,
    required TResult Function(ProjectGalleryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectGalleryInitial value)? initial,
    TResult? Function(ProjectGalleryLoading value)? loading,
    TResult? Function(ProjectGalleryLoaded value)? loaded,
    TResult? Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult? Function(ProjectGalleryUpdated value)? updated,
    TResult? Function(ProjectGalleryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectGalleryInitial value)? initial,
    TResult Function(ProjectGalleryLoading value)? loading,
    TResult Function(ProjectGalleryLoaded value)? loaded,
    TResult Function(ProjectGalleryLoadedSingle value)? loadedSingle,
    TResult Function(ProjectGalleryUpdated value)? updated,
    TResult Function(ProjectGalleryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProjectGalleryError implements ProjectgalleryState {
  const factory ProjectGalleryError(final String message) =
      _$ProjectGalleryErrorImpl;

  String get message;

  /// Create a copy of ProjectgalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectGalleryErrorImplCopyWith<_$ProjectGalleryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
