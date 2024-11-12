// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_gallery_s_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectGallerySEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGallery,
    required TResult Function(
            String title, String description, String date, File thumbnail)
        addProjectGallery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGallery,
    TResult? Function(
            String title, String description, String date, File thumbnail)?
        addProjectGallery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGallery,
    TResult Function(
            String title, String description, String date, File thumbnail)?
        addProjectGallery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGallery value) fetchGallery,
    required TResult Function(AddProjectGallery value) addProjectGallery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGallery value)? fetchGallery,
    TResult? Function(AddProjectGallery value)? addProjectGallery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGallery value)? fetchGallery,
    TResult Function(AddProjectGallery value)? addProjectGallery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectGallerySEventCopyWith<$Res> {
  factory $ProjectGallerySEventCopyWith(ProjectGallerySEvent value,
          $Res Function(ProjectGallerySEvent) then) =
      _$ProjectGallerySEventCopyWithImpl<$Res, ProjectGallerySEvent>;
}

/// @nodoc
class _$ProjectGallerySEventCopyWithImpl<$Res,
        $Val extends ProjectGallerySEvent>
    implements $ProjectGallerySEventCopyWith<$Res> {
  _$ProjectGallerySEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectGallerySEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchGalleryImplCopyWith<$Res> {
  factory _$$FetchGalleryImplCopyWith(
          _$FetchGalleryImpl value, $Res Function(_$FetchGalleryImpl) then) =
      __$$FetchGalleryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchGalleryImplCopyWithImpl<$Res>
    extends _$ProjectGallerySEventCopyWithImpl<$Res, _$FetchGalleryImpl>
    implements _$$FetchGalleryImplCopyWith<$Res> {
  __$$FetchGalleryImplCopyWithImpl(
      _$FetchGalleryImpl _value, $Res Function(_$FetchGalleryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchGalleryImpl implements FetchGallery {
  const _$FetchGalleryImpl();

  @override
  String toString() {
    return 'ProjectGallerySEvent.fetchGallery()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchGalleryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGallery,
    required TResult Function(
            String title, String description, String date, File thumbnail)
        addProjectGallery,
  }) {
    return fetchGallery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGallery,
    TResult? Function(
            String title, String description, String date, File thumbnail)?
        addProjectGallery,
  }) {
    return fetchGallery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGallery,
    TResult Function(
            String title, String description, String date, File thumbnail)?
        addProjectGallery,
    required TResult orElse(),
  }) {
    if (fetchGallery != null) {
      return fetchGallery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGallery value) fetchGallery,
    required TResult Function(AddProjectGallery value) addProjectGallery,
  }) {
    return fetchGallery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGallery value)? fetchGallery,
    TResult? Function(AddProjectGallery value)? addProjectGallery,
  }) {
    return fetchGallery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGallery value)? fetchGallery,
    TResult Function(AddProjectGallery value)? addProjectGallery,
    required TResult orElse(),
  }) {
    if (fetchGallery != null) {
      return fetchGallery(this);
    }
    return orElse();
  }
}

abstract class FetchGallery implements ProjectGallerySEvent {
  const factory FetchGallery() = _$FetchGalleryImpl;
}

/// @nodoc
abstract class _$$AddProjectGalleryImplCopyWith<$Res> {
  factory _$$AddProjectGalleryImplCopyWith(_$AddProjectGalleryImpl value,
          $Res Function(_$AddProjectGalleryImpl) then) =
      __$$AddProjectGalleryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, String description, String date, File thumbnail});
}

/// @nodoc
class __$$AddProjectGalleryImplCopyWithImpl<$Res>
    extends _$ProjectGallerySEventCopyWithImpl<$Res, _$AddProjectGalleryImpl>
    implements _$$AddProjectGalleryImplCopyWith<$Res> {
  __$$AddProjectGalleryImplCopyWithImpl(_$AddProjectGalleryImpl _value,
      $Res Function(_$AddProjectGalleryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? thumbnail = null,
  }) {
    return _then(_$AddProjectGalleryImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$AddProjectGalleryImpl implements AddProjectGallery {
  const _$AddProjectGalleryImpl(
      {required this.title,
      required this.description,
      required this.date,
      required this.thumbnail});

  @override
  final String title;
  @override
  final String description;
  @override
  final String date;
  @override
  final File thumbnail;

  @override
  String toString() {
    return 'ProjectGallerySEvent.addProjectGallery(title: $title, description: $description, date: $date, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProjectGalleryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, date, thumbnail);

  /// Create a copy of ProjectGallerySEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProjectGalleryImplCopyWith<_$AddProjectGalleryImpl> get copyWith =>
      __$$AddProjectGalleryImplCopyWithImpl<_$AddProjectGalleryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchGallery,
    required TResult Function(
            String title, String description, String date, File thumbnail)
        addProjectGallery,
  }) {
    return addProjectGallery(title, description, date, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchGallery,
    TResult? Function(
            String title, String description, String date, File thumbnail)?
        addProjectGallery,
  }) {
    return addProjectGallery?.call(title, description, date, thumbnail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchGallery,
    TResult Function(
            String title, String description, String date, File thumbnail)?
        addProjectGallery,
    required TResult orElse(),
  }) {
    if (addProjectGallery != null) {
      return addProjectGallery(title, description, date, thumbnail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchGallery value) fetchGallery,
    required TResult Function(AddProjectGallery value) addProjectGallery,
  }) {
    return addProjectGallery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchGallery value)? fetchGallery,
    TResult? Function(AddProjectGallery value)? addProjectGallery,
  }) {
    return addProjectGallery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchGallery value)? fetchGallery,
    TResult Function(AddProjectGallery value)? addProjectGallery,
    required TResult orElse(),
  }) {
    if (addProjectGallery != null) {
      return addProjectGallery(this);
    }
    return orElse();
  }
}

abstract class AddProjectGallery implements ProjectGallerySEvent {
  const factory AddProjectGallery(
      {required final String title,
      required final String description,
      required final String date,
      required final File thumbnail}) = _$AddProjectGalleryImpl;

  String get title;
  String get description;
  String get date;
  File get thumbnail;

  /// Create a copy of ProjectGallerySEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProjectGalleryImplCopyWith<_$AddProjectGalleryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectGallerySState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProjectGalleryMemberModel gallery) loaded,
    required TResult Function(ProjectGallery project) added,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult? Function(ProjectGallery project)? added,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult Function(ProjectGallery project)? added,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Added value) added,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Added value)? added,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Added value)? added,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectGallerySStateCopyWith<$Res> {
  factory $ProjectGallerySStateCopyWith(ProjectGallerySState value,
          $Res Function(ProjectGallerySState) then) =
      _$ProjectGallerySStateCopyWithImpl<$Res, ProjectGallerySState>;
}

/// @nodoc
class _$ProjectGallerySStateCopyWithImpl<$Res,
        $Val extends ProjectGallerySState>
    implements $ProjectGallerySStateCopyWith<$Res> {
  _$ProjectGallerySStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProjectGallerySStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProjectGallerySState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProjectGalleryMemberModel gallery) loaded,
    required TResult Function(ProjectGallery project) added,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult? Function(ProjectGallery project)? added,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult Function(ProjectGallery project)? added,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Added value) added,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Added value)? added,
    TResult? Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Added value)? added,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProjectGallerySState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProjectGallerySStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProjectGallerySState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProjectGalleryMemberModel gallery) loaded,
    required TResult Function(ProjectGallery project) added,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult? Function(ProjectGallery project)? added,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult Function(ProjectGallery project)? added,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Added value) added,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Added value)? added,
    TResult? Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Added value)? added,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProjectGallerySState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectGalleryMemberModel gallery});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ProjectGallerySStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gallery = null,
  }) {
    return _then(_$LoadedImpl(
      null == gallery
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as ProjectGalleryMemberModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements Loaded {
  const _$LoadedImpl(this.gallery);

  @override
  final ProjectGalleryMemberModel gallery;

  @override
  String toString() {
    return 'ProjectGallerySState.loaded(gallery: $gallery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.gallery, gallery) || other.gallery == gallery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gallery);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProjectGalleryMemberModel gallery) loaded,
    required TResult Function(ProjectGallery project) added,
    required TResult Function(String message) error,
  }) {
    return loaded(gallery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult? Function(ProjectGallery project)? added,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(gallery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult Function(ProjectGallery project)? added,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(gallery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Added value) added,
    required TResult Function(Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Added value)? added,
    TResult? Function(Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Added value)? added,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements ProjectGallerySState {
  const factory Loaded(final ProjectGalleryMemberModel gallery) = _$LoadedImpl;

  ProjectGalleryMemberModel get gallery;

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddedImplCopyWith<$Res> {
  factory _$$AddedImplCopyWith(
          _$AddedImpl value, $Res Function(_$AddedImpl) then) =
      __$$AddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectGallery project});
}

/// @nodoc
class __$$AddedImplCopyWithImpl<$Res>
    extends _$ProjectGallerySStateCopyWithImpl<$Res, _$AddedImpl>
    implements _$$AddedImplCopyWith<$Res> {
  __$$AddedImplCopyWithImpl(
      _$AddedImpl _value, $Res Function(_$AddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$AddedImpl(
      null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectGallery,
    ));
  }
}

/// @nodoc

class _$AddedImpl implements Added {
  const _$AddedImpl(this.project);

  @override
  final ProjectGallery project;

  @override
  String toString() {
    return 'ProjectGallerySState.added(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedImplCopyWith<_$AddedImpl> get copyWith =>
      __$$AddedImplCopyWithImpl<_$AddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProjectGalleryMemberModel gallery) loaded,
    required TResult Function(ProjectGallery project) added,
    required TResult Function(String message) error,
  }) {
    return added(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult? Function(ProjectGallery project)? added,
    TResult? Function(String message)? error,
  }) {
    return added?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult Function(ProjectGallery project)? added,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Added value) added,
    required TResult Function(Error value) error,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Added value)? added,
    TResult? Function(Error value)? error,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Added value)? added,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class Added implements ProjectGallerySState {
  const factory Added(final ProjectGallery project) = _$AddedImpl;

  ProjectGallery get project;

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddedImplCopyWith<_$AddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProjectGallerySStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProjectGallerySState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProjectGalleryMemberModel gallery) loaded,
    required TResult Function(ProjectGallery project) added,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult? Function(ProjectGallery project)? added,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProjectGalleryMemberModel gallery)? loaded,
    TResult Function(ProjectGallery project)? added,
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
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Loaded value) loaded,
    required TResult Function(Added value) added,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Loaded value)? loaded,
    TResult? Function(Added value)? added,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Loaded value)? loaded,
    TResult Function(Added value)? added,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ProjectGallerySState {
  const factory Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ProjectGallerySState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
